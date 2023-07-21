from fastapi import FastAPI
from pydantic import BaseModel
from typing import Optional


import torch
from transformers import BioGptTokenizer, BioGptForCausalLM, set_seed


tokenizer_art = BioGptTokenizer.from_pretrained("microsoft/biogpt")
model_art = BioGptForCausalLM.from_pretrained("microsoft/biogpt")

app = FastAPI()

class art_item(BaseModel):
    keyword:str
    min_len : Optional[int] = 150
    max_len : Optional[int] = 1024
class not_item(BaseModel):
    current : str
    old:str
    trait:str

def contentGenerate(query,min_len,max_len):
    try :
        global tokenizer_art, model_art
        inputs = tokenizer_art(query, return_tensors="pt")
        set_seed(42)
        with torch.no_grad():
            beam_output = model_art.generate(**inputs,
                                        min_length=min_len,
                                        max_length=max_len,
                                        num_beams=5,
                                        early_stopping=True
                                        )
        response = tokenizer_art.decode(beam_output[0], skip_special_tokens=True)
        return { "article":response }
    except :
        return {"article" : ""}


def compare(current,past):
    mapsevere = {
        "very high" :3,
        "high":2,
        "border":1,
        "low":0
    }
    current = mapsevere[current]
    past = mapsevere[past]
    if current < past :
        return 1
    elif current > past :
        return -1
    return 0

@app.get('/')
async def read_root():
    return {"response":"hello world"}


@app.post("/article/")
async def content(item:art_item):
    # print(item)
    return contentGenerate(item.keyword,item.min_len,item.max_len)

@app.post("/notification")
async def notify(item:not_item):
    return Notify(item.old,item.current,item.trait)
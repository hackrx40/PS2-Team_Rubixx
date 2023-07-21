from fastapi import FastAPI
from pydantic import BaseModel
# from transformers import AutoTokenizer, AutoModelForCausalLM, pipeline

import torch
from transformers import BioGptTokenizer, BioGptForCausalLM, set_seed


tokenizer_art = BioGptTokenizer.from_pretrained("microsoft/biogpt")
model_art = BioGptForCausalLM.from_pretrained("microsoft/biogpt")

app = FastAPI()

class art_item(BaseModel):
    keyword:str
    min_len:int
    max_len:int
    

def generateNotificationContent(keyword,min_len,max_len):
    global tokenizer_art, model_art
    inputs = tokenizer_art(keyword, return_tensors="pt")
    set_seed(42)
    with torch.no_grad():
        beam_output = model_art.generate(**inputs,
                                    min_length=min_len,
                                    max_length=max_len,
                                    num_beams=5,
                                    early_stopping=True
                                    )
    response = tokenizer_art.decode(beam_output[0], skip_special_tokens=True)
        
    return {"response":response}

@app.get('/')
async def read_root():
    return {"response":"hello world"}

@app.post("/article/")
async def getContent(item:art_item):
    return generateNotificationContent(item.keyword,item.min_len,item.max_len)
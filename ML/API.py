from fastapi import FastAPI
from pydantic import BaseModel
from typing import Optional

import random
import torch
from transformers import BioGptTokenizer, BioGptForCausalLM, set_seed
from fastapi.middleware.cors import CORSMiddleware


tokenizer_art = BioGptTokenizer.from_pretrained("microsoft/biogpt")
model_art = BioGptForCausalLM.from_pretrained("microsoft/biogpt")

app = FastAPI()
app.add_middleware(
    CORSMiddleware,
    allow_origins='*',
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

positive = ['The Advantages of Possessing good level ',
'Discover the Benefits of Having borderline ',
'Understanding the Upsides of Holding low level',
'Gaining from the Virtues of Owning ' 
'The Positive Side of low',
'Exploring the Pluses of good level of',
'Delving into the Profit of Possessing',
'Making the Most of Having',
'The Unexpected Bonuses of Retaining',
'Exploring the Benefits of Having',
'Why You Should Consider Getting',
'Appreciating the Assets of Owning',
'The Magic of Having',
'The Power and Potential of Possessing',
'Embrace the Gains of Securing',
'How Owning Can Enrich Your Life',
'The Hidden Advantages of Having']

negative=['Navigating the Complications of Living with Diabetes'
,'Unpacking the Struggles of Diabetic Life'
,'Understanding the Challenges of Diabetes Management'
,'The Hidden Troubles of Being Diabetic'
,'Coping with the Difficulties of Diabetes'
,'The Downside of Living with Diabetes'
,'Grappling with the Complexities of Diabetes'
,'Living in the Shadow of Diabetes: The Challenges and Struggles'
,'Behind the Diagnosis: The Realities of Living with Diabetes'
,'The Daily Struggles of Managing Diabetes' 
,'The Obstacles and Issues of Having Diabetes'
,'Encountering the Trials of Diabetes: A Comprehensive Overview'
,'The Tough Road: Dealing with Diabetes'
,'When Sugar Betrays: The Tribulations of Diabetes'
,'The Silent Battle: Facing the Challenges of Diabetes'
,'Sugar and Sorrow: The Dilemmas of Diabetes'
,'The Harsh Realities of Dealing with Diabetes'
,'The Unseen Battles: Confronting Diabetes Head-On'
,'Sugarcoated Struggles: The Hidden Challenges of Diabetes'
,'The Everyday Hurdles for People Living with Diabetes']

model_intro = {
    "Intro 1":
"Beep! Your health comes first. Stay informed."

,"Intro 2":
"Buzz, buzz! your personalized health assistants, always by your side."

,"Intro 3":
"Stay on top of your medical needs with the gentle reminders "

,"Intro 4":
"Be alerted to important health updates "

,"Intro 5":
"Your well-being matters. Let our medical phone notifications guide you towards a healthier tomorrow."

,"Intro 6":
"Experience the power of knowledge with our medical phone notifications, tailored to your health goals."

,"Intro 7":
"Stay connected to your healthcare journey."

,"Intro 8":
"From medication reminders to vital health insights"

,"Intro 10":
"Your health, our priority. Trust our medical phone notifications to keep you in the pink of health."
}


change_bh = {
    "positive":positive,  
    "negative":negative
}

class art_item(BaseModel):
    keyword:str
    min_len : Optional[int] = 150
    max_len : Optional[int] = 1024
class not_item(BaseModel):
    current : str
    old:str
    trait:str
class recommend_item(BaseModel):
    # input_symptoms:str 
    # input_disease:str 
    # input_doctor:str 
    # input_department:str 
    # input_severity:str
    # input_medical_test:str
    patient_id :int
    
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

def Notify(old,new,trait):
    headline = random.choice(list(model_intro.values()))
    change = compare(old,new)
    if change >=0:
        # choose random intro
        userquery = random.choice((change_bh['positive'])) + "{}".format(trait)
        # model.gen(userquery,)
    elif change < 0:
            userquery = random.choice(change_bh['negative']) + "{}".format(trait)
    print(userquery)
    try :
        global tokenizer_art, model_art
        inputs = tokenizer_art(userquery, return_tensors="pt")
        set_seed(42)
        with torch.no_grad():
            beam_output = model_art.generate(**inputs,
                                        min_length=50,
                                        max_length=300,
                                        num_beams=5,
                                        early_stopping=True
                                        )
        response = tokenizer_art.decode(beam_output[0], skip_special_tokens=True)
        return { "headline":headline,"article":response }
    except :
        return {"headline":headline,"article" : ""}


def Recommend(patient_id):
    return {"response":"OK"}


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

@app.post("/recommend/")
async def recommend(item:recommend_item):
    return Recommend(item.patient_id)
from fastapi import FastAPI
from pydantic import BaseModel
from typing import Optional

import random
import torch
from transformers import BioGptTokenizer, BioGptForCausalLM, set_seed


tokenizer_art = BioGptTokenizer.from_pretrained("microsoft/biogpt")
model_art = BioGptForCausalLM.from_pretrained("microsoft/biogpt")

app = FastAPI()

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
"Beep! Your health comes first. Stay informed and cared for with our medical phone notifications."

,"Intro 2":
"Buzz, buzz! Our medical phone notifications are your personalized health assistants, always by your side."

,"Intro 3":
"Stay on top of your medical needs with the gentle reminders of our health-focused phone notifications."

,"Intro 4":
"Be alerted to important health updates with the reassuring tones of our medical phone notifications."

,"Intro 5":
"Your well-being matters. Let our medical phone notifications guide you towards a healthier tomorrow."

,"Intro 6":
"Experience the power of knowledge with our medical phone notifications, tailored to your health goals."

,"Intro 7":
"Stay connected to your healthcare journey. Embrace the support of our medical phone notifications."

,"Intro 8":
"From medication reminders to vital health insights, our medical phone notifications have you covered."

,"Intro 9":
"Unlock a world of better health with our intelligent medical phone notifications at your fingertips."

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
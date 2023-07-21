from fastapi import FastAPI
from pydantic import BaseModel


app = FastAPI()

class art_item(BaseModel):
    keyword:str
    min_len:int
    max_len:int
    

def generateNotificationContent(keyword,min_len,max_len):
    return {"response":"Got your query {}".format(keyword)}

@app.get('/')
async def read_root():
    return {"response":"hello world"}

@app.post("/article/")
async def getContent(item:art_item):
    return generateNotificationContent(item.keyword,item.min_len,item.max_len)
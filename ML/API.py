from fastapi import FastAPI
from pydantic import BaseModel


app = FastAPI()

class art_item(BaseModel):
    keyword:str
    min_len:int
    max_len:int
    


@app.get('/')
async def read_root():
    return {"response":"hello world"}
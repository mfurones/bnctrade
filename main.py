
from fastapi import FastAPI

# Parameters



app = FastAPI()



@app.get("/")
def read_root():
    return {"Hello": "World"}



from fastapi import FastAPI

app = FastAPI()

@app.get("/")
def read_root():
    # Pesan ini akan kita ubah nanti untuk tes deploy
    return {"message": "Hello World! v1.0"}

@app.get("/items/{item_id}")
def read_item(item_id: int, q: str | None = None):
    return {"item_id": item_id, "q": q}
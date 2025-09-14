from fastapi import FastAPI

app = FastAPI()

@app.get("/")
def read_root():
    return {"message": "Hello World! Otomatis deploy dari GitHub Actions berhasil!"}

@app.get("/status")
def get_status():
    return {"status": "ok"}
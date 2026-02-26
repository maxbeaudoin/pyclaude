from fastapi import FastAPI

app = FastAPI()


@app.get("/")
def main():
    return {"message": "Hello Universe"}


@app.get("/health")
def health():
    return {"status": "ok"}


@app.get("/version")
def version():
    return {"version": "0.1.0"}

from fastapi import FastAPI

# Create an instance of the FastAPI class
app = FastAPI()

# Define a simple route
@app.get("/")
def read_root():
    return {"message": "Hello, World!"}

# Define another route with a path parameter
@app.get("/greet/{name}")
def greet(name: str):
    return {"message": f"Hello, {name}!"}
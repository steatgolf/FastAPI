# Variables
# src folder , mian.py and app from fastapi()
SRC_DIR = src
TEST_DIR = tests
#ENV = .env  #hidden path
APP_NAME = src.main:app
HOST = 127.0.0.1
PORT = 3000

# Commands
.PHONY: venv run test clean
venv: 
	python3 -m venv $(SRC_DIR)/.venv
	. $(SRC_DIR)/.venv/bin/activate && pip install -Ur $(SRC_DIR)/requirements.txt
	
test: venv ## 🎯 Unit tests for FastAPI
	. $(SRC_DIR)/.venv/bin/activate \
	PYTHONPATH=src pytest \
	&& pytest -v $(SRC_DIR)/$(TEST_DIR)

run: venv ## 🏃 Run the server locally using Python & FastAPI
	. $(SRC_DIR)/bin/activate \
	&& python src/main.py
# Clean up generated files
clean:
	rm -rf __pycache__ .pytest_cache .mypy_cache
	rm -rf $(SRC_DIR)/ .venv
	find . -type d -name "*.egg-info" -exec rm -rf {} +
	find . -type d -name "*.pyc" -exec rm -rf {} +
	find . -type d -name "*.pyo" -exec rm -rf {} +
	find . -type f -name "*.log" -delete
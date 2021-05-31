# syntax=docker/dockerfile:1

FROM python:2-slim
RUN pip install pyinstaller
# COPY requirements.txt ./
# RUN pip install --no-cache-dir -r requirements.txt

WORKDIR /app
COPY . .
CMD [ "python", "./main.py"]

FROM python:3.9-slim-bullseye

RUN apt-get -y update && \
   apt-get install -y --no-install-recommends build-essential  \
   curl wget nginx ca-certificates npm \
   && npm install pm2 -g \
   && pip install --upgrade pip setuptools \
   && rm -rf /var/lib/apt/lists/*
   
COPY app/requirements.txt .
RUN pip install -r requirements.txt


FROM ubuntu:20.04

RUN apt-get update && apt-get install -y \
git \
curl \
ca-certificates \
python3 \
python3-pip

RUN mkdir /app
COPY ./requirements.txt /app/requirements.txt
WORKDIR /app

RUN python3 -m pip install -r requirements.txt
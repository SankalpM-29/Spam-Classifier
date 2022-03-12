FROM ubuntu:20.04

RUN apt-get update && apt-get install -y \
git \
curl \
ca-certificates \
python3 \
python3-pip

RUN mkdir /spam
COPY .env /spam/.env
COPY ./app /spam/app
COPY ./requirements.txt /spam/requirements.txt
COPY ./entrypoint.sh /spam/entrypoint.sh
COPY ./pipelines /spam/pipelines/

WORKDIR /spam

RUN python3 -m pip install -r requirements.txt

RUN python3 -m pypyr /spam/pipelines/decrypt

CMD ["./entrypoint.sh"]
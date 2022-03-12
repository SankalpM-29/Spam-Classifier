#!/bin/bash

RUN_PORT=${PORT:-8000}

/usr/local/lib/python3.8/dist-packages/gunicorn --worker-tmp-dir /dev/shm -k uvicorn.workers.UvicornWorker --bind "0.0.0.0:${RUN_PORT}" app.main:app 
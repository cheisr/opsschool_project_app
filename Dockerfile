FROM python:3.5-alpine

WORKDIR /app
COPY source/ /app

RUN pip install -r requirements.txt

ENTRYPOINT ["python", "server.py"]

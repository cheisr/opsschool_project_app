FROM python:3.5-alpine

WORKDIR /app
COPY source/ /app

RUN pip3 install -r requirements.txt
EXPOSE 8181
ENTRYPOINT ["python", "server.py"]

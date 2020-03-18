FROM python:3.5-alpine

WORKDIR /app
COPY source/ /app

RUN pip install -r requirements.txt

ENV MYSQL_ADDRESS MYSQL_USER MYSQL_PWD

ENTRYPOINT ["python", "server.py"]

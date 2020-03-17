FROM alpine:latest

RUN apk update && \
    apk add  python3 

# We copy just the requirements.txt first to leverage Docker cache
COPY ./requirements.txt source_code/app

WORKDIR /app

RUN pip3 install -r requirements.txt

ENV MYSQL_ADDRESS MYSQL_USER MYSQL_PWD

COPY . /app

ENTRYPOINT [ "python3", "server.py" ]

CMD [ "app.py" ]

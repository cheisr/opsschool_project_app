FROM alpine:latest

RUN apk update && \
    apk add  python3 

# We copy just the requirements.txt first to leverage Docker cache
COPY ./requirements.txt /app/requirements.txt

WORKDIR /app

RUN pip3 install -r requirements.txt

ENV MYSQL_ADDRESS MYSQL_USER MYSQL_PWD

COPY . /app

ENTRYPOINT [ "python3" ]

CMD [ "app.py" ]

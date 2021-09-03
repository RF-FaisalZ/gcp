FROM python:3.9-slim

RUN apt-get clean \
    && apt-get -y update

RUN apt-get -y install \
    apt-utils \
    nginx \
    python3-dev \
    build-essential

WORKDIR /app

ADD . /app

RUN pip install -r requirements.txt --src /usr/local/src

EXPOSE 8080
CMD [ "python", "/app/app.py" ]
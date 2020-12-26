FROM python:3.8-alpine

# LABEL author="dnature"

ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /requirements.txt

RUN apk add --update --no-cache postgresql-client
RUN apk add --update --no-cache --virtual .tmp-build-deps \
    gcc libc-dev linux-headers postgresql-dev

RUN pip --version && python --version

RUN pip install -r /requirements.txt
RUN apk del .tmp-build-deps

RUN django-admin --version

RUN mkdir ./app

WORKDIR /app

COPY ./app .

RUN adduser --disabled-password user

USER user
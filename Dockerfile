FROM python:3.8.7

# LABEL author="dnature"

ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /requirements.txt

RUN pip --version && python --version

RUN pip install -r /requirements.txt

RUN django-admin --version

RUN mkdir ./app

WORKDIR /app

COPY ./app .

RUN adduser --disabled-password user

USER user
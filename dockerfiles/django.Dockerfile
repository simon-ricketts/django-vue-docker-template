FROM node:10-slim AS vue-compiler

RUN apt-get update && apt-get install python g++ build-essential -y

WORKDIR /usr/src/app
COPY ./exampleproject/frontend/package* ./

RUN npm ci

COPY ./exampleproject/frontend .

RUN npm run build



FROM python:3.7-slim

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

WORKDIR /exampleproject

RUN pip install pipenv
COPY Pipfile* ./
RUN pipenv install --dev --system --ignore-pipfile --deploy

COPY ./exampleproject .
COPY --from=vue-compiler /usr/src/app/webpack-stats.json ./frontend/webpack-stats.json
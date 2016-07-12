FROM python:2.7
FROM node:5.6

MAINTAINER Vic Kumar (vickumar@gmail.com)

ENV PYTHONUNBUFFERED 1

RUN npm install -g grunt
RUN npm install -g gulp
RUN npm install -g bower
RUN npm install -g less
RUN npm install -g protractor

RUN apt-get update
RUN apt-get install -y git git-core python-dev libmysqlclient-dev mysql-client python-yaml
RUN mkdir -p /requirements
RUN mkdir -p /apps
RUN mkdir -p /code
RUN mkdir -p /collectstatic

WORKDIR /requirements
ADD . /requirements/

RUN mkdir /pip
RUN curl https://bootstrap.pypa.io/get-pip.py -o /pip/get-pip.py
RUN python /pip/get-pip.py
RUN pip install -r /requirements/requirements.txt


FROM python:3.7
ENV PYTHONUNBUFFERED 1

RUN mkdir /dev-ops-app
WORKDIR /dev-ops-app
ADD requirements.txt /dev-ops-app/
RUN pip install -r requirements.txt
ADD . /dev-ops-app/
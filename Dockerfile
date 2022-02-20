FROM python:3.10-alpine
LABEL MAINTAINER Evangelos Patsourakos

# Tell python to run to unbuffered mode which is the recommended
ENV PYTHONBUFFERED 1

# Install independencies
# copy the requirements.txt on docker image
COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

RUN mkdir /app
WORKDIR /app
COPY ./app /app

# Create a user with only run application permissions.
RUN adduser -D user
USER user


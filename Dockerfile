# what Docker image to build on top of?
FROM ubuntu:latest

# what to install
RUN apt-get update && apt-get -y update
RUN apt-get install -y build-essential git python3.7 python3-pip python3-dev
RUN pip -q install pip --upgrade

# working directory, copy everything over
WORKDIR /app
COPY . /app

# load packages
RUN pip install -r requirements.txt

# expose?
EXPOSE 9999

ENV PATH=$PATH:/home/docker/.local/bin
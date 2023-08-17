FROM python:latest
RUN apt update && apt upgrade -y && apt autoremove -y
RUN apt install -y protobuf-compiler
RUN mkdir -p /usr/local/cml

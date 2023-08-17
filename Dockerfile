FROM node:latest
RUN apt update && apt upgrade -y && apt autoremove -y
RUN apt install -y git protobuf-compiler python3 python3-pip python3-venv
RUN npm install -g protoc-gen-js
RUN mkdir -p /usr/local/cml
RUN git config --global --add safe.directory /usr/local/cml

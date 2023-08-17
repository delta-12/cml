#!/bin/bash

echo "Initializing submodules..."
git config --global --add safe.directory /usr/local/cml/nanopb
git submodule init
python3 -m venv env
source env/bin/activate
pip3 install -r requirements.txt

OUT_DIR=./out
if [ ! -d "$OUT_DIR" ]; then
    echo "Creating output directory"
    mkdir -p $OUT_DIR
fi

echo "Generating protobufs for python..."
PYTHON_OUT_DIR=$OUT_DIR/python
if [ ! -d "$PYTHON_OUT_DIR" ]; then
    echo "Creating Python output directory"
    mkdir -p $PYTHON_OUT_DIR
fi
protoc --python_out=$PYTHON_OUT_DIR payload.proto

echo "Generating protobufs for Javascript..."
JS_OUT_DIR=$OUT_DIR/js
if [ ! -d "$JS_OUT_DIR" ]; then
    echo "Creating Javascript output directory"
    mkdir -p $JS_OUT_DIR
fi
protoc --js_out=$JS_OUT_DIR payload.proto

echo "Generating protobufs for C..."
C_OUT_DIR=$OUT_DIR/c
if [ ! -d "$C_OUT_DIR" ]; then
    echo "Creating C output directory"
    mkdir -p $C_OUT_DIR
fi
cd nanopb
git submodule update --remote
cd ../
python3 nanopb/generator/nanopb_generator.py payload.proto -D $C_OUT_DIR

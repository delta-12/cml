#!/bin/bash

echo "Installing dependencies..."
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
protoc -I $PWD --python_out=$PYTHON_OUT_DIR $PWD/client/*.proto
protoc -I $PWD --python_out=$PYTHON_OUT_DIR $PWD/common/*.proto
protoc -I $PWD --python_out=$PYTHON_OUT_DIR $PWD/device/*.proto
protoc -I $PWD --python_out=$PYTHON_OUT_DIR $PWD/payload.proto

echo "Generating protobufs for Javascript..."
JS_OUT_DIR=$OUT_DIR/js
if [ ! -d "$JS_OUT_DIR" ]; then
    echo "Creating Javascript output directories"
    mkdir -p $JS_OUT_DIR
    mkdir $JS_OUT_DIR/client
    mkdir $JS_OUT_DIR/common
    mkdir $JS_OUT_DIR/device
fi
protoc -I $PWD --js_out=$JS_OUT_DIR/client $PWD/client/*.proto
protoc -I $PWD --js_out=$JS_OUT_DIR/common $PWD/common/*.proto
protoc -I $PWD --js_out=$JS_OUT_DIR/device $PWD/device/*.proto
protoc -I $PWD --js_out=$JS_OUT_DIR $PWD/payload.proto

echo "Generating protobufs for C..."
C_OUT_DIR=$OUT_DIR/c
if [ ! -d "$C_OUT_DIR" ]; then
    echo "Creating C output directory"
    mkdir -p $C_OUT_DIR
fi
python3 nanopb/generator/nanopb_generator.py -I $PWD $PWD/client/*.proto -D $C_OUT_DIR
python3 nanopb/generator/nanopb_generator.py -I $PWD $PWD/common/*.proto -D $C_OUT_DIR
python3 nanopb/generator/nanopb_generator.py -I $PWD $PWD/device/*.proto -D $C_OUT_DIR
python3 nanopb/generator/nanopb_generator.py -I $PWD $PWD/payload.proto -D $C_OUT_DIR

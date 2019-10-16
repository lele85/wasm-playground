#!/bin/sh

SOURCE_PATH=./src
BUILD_PATH=./build
INCLUDE_PATH=./lib

clang \
  --target=wasm32 \
  -emit-llvm \
  -c \
  -S $SOURCE_PATH/calc.c \
  -o $BUILD_PATH/calc.ll \
  -I$INCLUDE_PATH
  

clang \
  --target=wasm32 \
  -emit-llvm \
  -c \
  -S $SOURCE_PATH/functions.c \
  -o $BUILD_PATH/functions.ll \
  -I$INCLUDE_PATH

clang \
  --target=wasm32 \
  -emit-llvm \
  -c \
  -S $INCLUDE_PATH/stdio.c \
  -o $BUILD_PATH/stdio.ll

llc \
  -march=wasm32 \
  -filetype=obj \
  $BUILD_PATH/calc.ll

llc \
  -march=wasm32 \
  -filetype=obj \
  $BUILD_PATH/functions.ll

llc \
  -march=wasm32 \
  -filetype=obj \
  $BUILD_PATH/stdio.ll

wasm-objdump -x $BUILD_PATH/calc.o
wasm-objdump -x $BUILD_PATH/functions.o
wasm-objdump -x $BUILD_PATH/stdio.o

wasm-ld \
  --no-entry \
  --export-all \
  -o $BUILD_PATH/calc.wasm \
  $BUILD_PATH/calc.o \
  $BUILD_PATH/functions.o \
  $BUILD_PATH/stdio.o

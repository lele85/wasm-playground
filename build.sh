#!/bin/sh

rm build/*.wasm
rm build/*.ll
rm build/*.o

SOURCE_PATH=./src
BUILD_PATH=./build
clang \
  --target=wasm32 \
  -emit-llvm \
  -c \
  -S $SOURCE_PATH/calc.c \
  -o $BUILD_PATH/calc.ll  

clang \
  --target=wasm32 \
  -emit-llvm \
  -c \
  -S $SOURCE_PATH/functions.c \
  -o $BUILD_PATH/functions.ll

llc \
  -march=wasm32 \
  -filetype=obj \
  $BUILD_PATH/calc.ll

llc \
  -march=wasm32 \
  -filetype=obj \
  $BUILD_PATH/functions.ll

wasm-objdump -x $BUILD_PATH/calc.o
wasm-objdump -x $BUILD_PATH/functions.o

wasm-ld \
  --no-entry \
  --export-all \
  -o $BUILD_PATH/calc.wasm \
  $BUILD_PATH/calc.o \
  $BUILD_PATH/functions.o

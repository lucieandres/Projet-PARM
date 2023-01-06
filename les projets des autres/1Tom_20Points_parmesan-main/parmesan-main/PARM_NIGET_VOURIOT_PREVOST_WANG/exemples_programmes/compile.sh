#!/bin/bash
filename="$1"
clang-8 -S -target arm-v4t-eabi -nostdlib -mcpu=cortex-m0 -mthumb -O0 ${filename} && ./assembleur_tom.py ${filename%.*}.s

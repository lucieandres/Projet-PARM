#!/bin/bash
filename="$1"
arm-none-eabi-gcc -S -mthumb -nostdlib -mtune=cortex-m0 -mcpu=cortex-m0 -fomit-frame-pointer -O0 ${filename} && ./assembleur_tom.py ${filename%.*}.s

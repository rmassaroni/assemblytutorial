#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Usage: $0 <file.asm>"
    exit 1
fi

filename=$(basename -- "$1")
basename="${filename%.*}"

nasm -f elf64 -o "$basename.o" "$1"
if [ $? -ne 0 ]; then
    echo "Assembly failed."
    exit 1
fi

ld -o "$basename" "$basename.o"
if [ $? -ne 0 ]; then
    echo "Linking failed."
    exit 1
fi

echo "Running $basename:"
./"$basename"

rm "$basename.o"


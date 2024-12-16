#!/bin/bash

# Program name: "Circuit Current Calculator". This program calculates currents in a 
# circuit with two parallel sub-circuits using IEEE floating-point precision.
# Copyright (C) <2024>  <William Dam>

# This file is part of the software program "Circuit Current Calculator".

# Circuit Current Calculator is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# Circuit Current Calculator is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program. If not, see <https://www.gnu.org/licenses/>. 

# Author information
#   Author name : William Dam
#   Author email: william.dam@example.com
#   Author section: 240-3
#   Author CWID : 123456789

echo "Compiling driver.asm..."
nasm -f elf64 -o driver.o driver.asm

echo "Compiling faraday.asm..."
nasm -f elf64 -o faraday.o faraday.asm

echo "Compiling atof.asm..."
nasm -f elf64 -o atof.o atof.asm

echo "Compiling ftoa.asm..."
nasm -f elf64 -o ftoa.o ftoa.asm

echo "Compiling strlen.asm..."
nasm -f elf64 -o strlen.o strlen.asm

echo "Linking the object files..."
gcc -m64 -no-pie -o hw6.out -std=c17 driver.o faraday.o atof.o ftoa.o strlen.o #-fno-pie

echo "Running hw6..."
./hw6.out

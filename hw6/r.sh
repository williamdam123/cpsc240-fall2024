#!/bin/bash

# Program name: "Circuit Current Calculator". This program calculates the current 
# based on the resistance and electromagnetic force (EMF) with input validation for float input.
# Copyright (C) <2024>  <William Dam>

# This file is part of the software program "Circuit Current Calculator".

# Circuit Current Calculator is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by the
# Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# Circuit Current Calculator is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program. If not, see <https://www.gnu.org/licenses/>. 

# Author information
#   Author name : William Dam
#   Author email: wdam1@csu.fullerton.edu
#   Author section: CPSC240-19
#   Author CWID : 884616384

echo "Compiling the driver file..."
nasm -f elf64 -o driver.o driver.asm

echo "Compiling the faraday file..."
nasm -f elf64 -o faraday.o faraday.asm

echo "Compiling the atof file..."
nasm -f elf64 -o atof.o atof.asm

echo "Compiling the ftoa file..."
nasm -f elf64 -o ftoa.o ftoa.asm

echo "Compiling the strlen file..."
nasm -f elf64 -o strlen.o strlen.asm

echo "Linking the object files..."
gcc -m64 -no-pie -o hw6.out driver.o faraday.o atof.o ftoa.o strlen.o -lc

echo "Running hw6..."
./hw6.out

#!/bin/bash

# Program name: "Electric Current Calculator". This program calculates the current 
# in a circuit with two parallel sub-circuits using modular components.
# Copyright (C) 2024 William Dam

# This file is part of the software program "Electric Current Calculator".

# Electric Current Calculator is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# Electric Current Calculator is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program. If not, see <https://www.gnu.org/licenses/>.

# Author information
#   Author name : William Dam
#   Author email: wdam1@csu.fullerton.edu
#   Author section: 240-19
#   Author CWID : 884616384

echo "Compiling the tesla file..."
gcc -c -m64 -Wall -fno-pie -no-pie -o tesla.o tesla.c -std=c17

echo "Compiling the edison file..."
nasm -f elf64 -o edison.o edison.asm

echo "Linking the object files..."
gcc -m64 -no-pie -o programmingfinal -std=c17 tesla.o edison.o

echo "Running programmingfinal..."
./programmingfinal

// Program name: "Electric Current Calculator". This program calculates the current 
// in a circuit with two parallel sub-circuits using modular components.
// Copyright (C) 2024 William Dam

// This file is part of the software program "Electric Current Calculator".

// Electric Current Calculator is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.

// Electric Current Calculator is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
// GNU General Public License for more details.

// You should have received a copy of the GNU General Public License
// along with this program. If not, see <https://www.gnu.org/licenses/>. 

// Author information
//   Author name : William Dam
//   Author email: wdam1@csu.fullerton.edu
//   Author section: 240-19
//   Author CWID : 884616384

#include <stdio.h>

// Declaration of electricity function from edison.asm
extern float electricity(float E, float R1, float R2);

int main() {
    printf("Welcome to Palm Beach Electric Company.\n");
    printf("This software is maintained by Frank Sinatra.\n\n");

    // Input values
    float E, R1, R2;

    printf("Please enter the electric force in the circuit (volts): ");
    if (scanf("%f", &E) != 1) {
        printf("Error: Invalid input for electric force.\n");
        return 1;
    }

    printf("Please enter the resistance in circuit number 1 (ohms): ");
    if (scanf("%f", &R1) != 1) {
        printf("Error: Invalid input for resistance in circuit 1.\n");
        return 1;
    }

    printf("Please enter the resistance in circuit number 2 (ohms): ");
    if (scanf("%f", &R2) != 1) {
        printf("Error: Invalid input for resistance in circuit 2.\n");
        return 1;
    }

    printf("\nThank you.\n");

    // Call electricity function
    float I = electricity(E, R1, R2);

    printf("The main received this number %.5f and will keep it for later.\n", I);
    printf("A zero will be returned to the operating system. Bye\n");

    return 0;
}

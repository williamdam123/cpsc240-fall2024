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

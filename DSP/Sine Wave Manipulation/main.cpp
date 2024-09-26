#include <math.h>
#include <stdio.h>
#include "Complex.hpp"

using namespace std;

#define CYCLES 1000

int main(int argc, char const *argv[])
{
    FILE* filePtr = fopen("output.txt", "w");
    Complex gen = Complex(1.0, 0);
    Complex z = Complex(cos(0.02), sin(0.02));

    for (size_t i = 0; i < CYCLES; i++)
    {
        gen = gen.Multiply(z);
        fprintf(filePtr, "%f\n", gen.GetRe());
    }
    fclose(filePtr);

    return 0;
}

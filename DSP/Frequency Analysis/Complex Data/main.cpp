#include <math.h>
#include <stdio.h>
#include "Complex.hpp"

using namespace std;

#define CYCLES 128
#define _USE_MATH_DEFINES

int main(int argc, char const *argv[])
{
    FILE* filePtr = fopen("output.txt", "w");
    Complex gen = Complex(1.0, 0);
    Complex z = Complex(cos(2* M_PI / 128 ), sin(2* M_PI / 128));

    for (size_t i = 0; i < CYCLES; i++)
    {
        gen = gen.Multiply(z);
        fprintf(filePtr, "%f\n", gen.GetRe());
    }
    fclose(filePtr);

    return 0;
}

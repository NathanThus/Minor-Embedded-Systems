#include "Complex.hpp"
#include <math.h>

Complex::Complex(double re, double im)
{
    this->re = re;
    this->im = im;
}

Complex Complex::Multiply(Complex z)
{
    return {(z.GetRe() * GetRe() - z.GetIm() * GetIm()), (z.GetRe() * GetIm() + z.GetIm() * GetRe())};
}

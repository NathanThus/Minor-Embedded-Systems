class Complex
{
private:
    double re;
    double im;

public:
    Complex(double re, double im);
    double GetRe() { return re; }
    double GetIm() { return im; }
    Complex Multiply(Complex z);
};

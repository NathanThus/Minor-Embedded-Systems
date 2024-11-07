# Sine Wave Manipulation

GOAL: Create a sine wave in MATLAB using complex numbers.

How: Using complex number multiplication, to create a sine wave.

## Code

`Complex.hpp` & `Complex.cpp` - The complex number code files.

`main.cpp` - Contains the code to actually use the complex numbers, as well as some fileIO for use in MATLAB.

`Graph.m` - Basic MATLAB code for importing the data.

`Output.txt` - The output data from running `main.cpp`

## Compilation & Execution

Using GCC:
`gcc *cpp -o text.exe`

Running:
`./test.exe`

## Evidence

After reading the Complex numbers textbook, I tried doing some basic math with the textbook. After some moderate success, I found the rule about multiplication, which was the core of this assignment. In the end, it boiled down to: `(Zr+Zi)(Wr+Wi) = Zr * Wr - Zi * Wi`.

Using continuous multiplication, I managed to effectively replicate the math behind complex numbers. Below is a code snippet from `Complex.cpp`.

```cpp
Complex Complex::Multiply(Complex z)
{
    return {(z.GetRe() * GetRe() - z.GetIm() * GetIm()), (z.GetRe() * GetIm() + z.GetIm() * GetRe())};
}
```

Looping through this with cosine and sin functions gave the following output:

![A sine wave, made from output.txt](SineWave.png)

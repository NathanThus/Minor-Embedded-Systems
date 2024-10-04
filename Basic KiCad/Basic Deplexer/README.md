# Basic Demultiplexer

After a presentation about basic logic gates (and a brief introduction to IC's), I saw this as a golden opportunity to create a PCB design using an IC.

## The IC - CD74HC4051-E

While the choice of demultiplexer wasn't exactly spectacular (Simply one I had found while searching the internet), it's exact function is quite interesting. It allows a circuit to switch channels, depending on a given input. A key note here is the difference between **multiplexers** and **demultiplexers**.

### Multiplexer

Multiplexers allow the system to output **one** signal, choosing from a given channel. If you had three input channels, and decided to attach them as follows:

| Channel | Frequency |
| ------- | --------- |
| 1       | 40Hz      |
| 2       | 80Hz      |
| 3       | 160Hz     |

When a specific channel is selected, you can measure the pulsing of the output to match the input pulse.

### Demultiplexer

Demultiplexers allow for a single input, but instead can route it to multiple **outputs**. It's typically used for routing data to a given output,

### Logic Interaction

For selecting the specific I/O Channel, a set of switches using binary logic are used. Below is a truth-table for clarity.

| Switch 1 | Switch 2 | Switch 3 | Lane |
| -------- | -------- | -------- | ---- |
| 0        | 0        | 0        | 1    |
| 1        | 0        | 0        | 2    |
| 0        | 1        | 0        | 3    |
| 1        | 1        | 0        | 4    |
| 0        | 0        | 1        | 5    |
| 1        | 0        | 1        | 6    |
| 0        | 1        | 1        | 7    |
| 1        | 1        | 1        | 8    |

## The Design
The design itself is rather basic. Using the aforementioned CD74HC4051-E, I created a basic circuit using the [the datasheet](https://www.ti.com/lit/ds/symlink/cd74hc4051-ep.pdf?ts=1727777069779&ref_url=https%253A%252F%252Fwww.google.com%252F). Connecting EBar to ground allows me to set the IC to act as a demultiplexer, while VEE (The input) is connected to 5V. Pins A0-A7 are connected to LEDS, while S0-S2 are connected to the buttons.
![A technical schematic of the PCB](<Pasted image 20241004111141.png>)
*A schematic of the PCB*

### The Socket

Finding the correct socket was rather tedious, as it meant manually wadding though several libraries worth of undocumented pinouts. In the end, the 16-Pin (2x8) DIP Package had the correct footprint, allowing me to move on to the most fun and potentially chaotic step in the process, laying out the tracks.

### Copper Fill

After first creating what can only be described as copper spaghetti, Tom, a friend of mine who is far more versed in PCB design than I am, guided me to copper fill. In essence, it is creating a sheet of copper on the PCB, for you to use however you wish. Typically, it is used to connect various components to ground, though if the PCB doesn't use high frequency signals, it can also be used to deliver power.

## The PCB

![The routing of the PCB Tracks displayed.](<Pasted image 20241004112746.png>)
*Red is the power / signal lines, blue is always to ground.*

## 3D Render

![A 3D model of the PCB.](<Basic Deplexer.jpg>)
*Yeah, there's no 3D Model for the buttons. I've tried a few different ones, but I might need to hunt a model down manually.*

## Sources

Texas Instruments. (2002, September). _CD74HC4051-EP Analog Multiplexer and Demultiplexer_. Retrieved October 2, 2024, from https://www.ti.com/lit/ds/symlink/cd74hc4051-ep.pdf
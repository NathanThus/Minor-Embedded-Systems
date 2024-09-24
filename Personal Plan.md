## Introduction
This semester, I want to make sure that I am ready for the embedded systems field, by diving into creating my own custom device, namely a game controller. This fits my personal development due to my history of Game Development (GDT-B, GDT-A & Internship), as well as understanding working with devices on an even lower level than previously.

## Ingredients

The end goal for this semester is create (effectively) a Wii Nunchuck / Xbox 360 controller clone on a PCB. This must include:
- IMU (Inertial Measurement unit)
	- Gyroscope, Accelerometer & Magnetometer (calibration)
- Joystick (2x)
	- X/Y Axis, 1 Button
- Digital Buttons
	- On/Off Signal, used in most buttons
- Analog Buttons
	- Detect **how** much they are pressed, similar to the sliding scale of a potentiometer. Useful for racing games or precision inputs.
- Main Controller - Raspberry Pico / ESP32 / Teensy
- Battery & Management
	- In case I want to go wireless.

## The Overall Plan

Starting off however, I will be designing far simpler circuits, while diving into the inner workings of the aforementioned components, alongside some others that interest me, such as the 555 Timer IC.

### Measurement
Before integration, I will need to perform simple measurements to define each sensors characteristics. This should not occur on a software level (IE putting an arduino in the middle), but rather data analysis via Oscilloscope / Analog Discovery. Data should end up in MATLAB, where I can then create nice looking diagrams for my portfolio / website.

### A brief note on voltage

One thing to keep in mind is that a fair few components run on 5V power, despite the majority of available dev boards only being 3.3V compatible. This will require stepping down the voltage, losing some amount of precision in translation.

### Communication

The controller should be able to communicate with a (simple) game I develop, where I can demonstrate the controller working. Whether the communication is wireless or not, depends on the complexity of the project as well as the time frame.
If I have a fair amount of spare time, I might try to mimic the PS3/Xbox 360 controllers protocol. This, theoretically, would allow it to be compatible with a variety of games, as it mimics the actual controller.

## And a side of...

A side project I would love to attempt is creating my own NFC "Business Card". Effectively, it allows me to transfer my contact details (or open my website) on a companies phone, giving them instant access to my details. This is a more long-standing personal project however, and does not take priority over the game controller.
### Alternative

If I have more time than I thought I needed, one other project that would be interesting was a suggestion by Jan Dobbelsteen, namely researching the intense power consumption of graphics cards. Though, due to the complexity of the other project, this will most likely not bear any fruits.

## In the End
I intend to have a solid grasp on Embedded Systems development, allowing me to work in the field. As this is my backup for Game Development (A field which is quite notorious for high turnover rates, even more so recently), having a stable backup will be a welcome addition in the future.
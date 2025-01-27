# The Making Of A Controller

## The Concept - To no-ones surprise

This semester, I want to make sure that I am ready for the embedded systems field, by diving into creating my own custom device, namely a game controller. This fits my personal development due to my history of Game Development (GDT-B, GDT-A & Internship), as well as understanding working with devices on an even lower level than previously.

Additionally, this gives me a deeper understanding of the entire tech stack surrounding videogames, and uniquely qualifies me in the Serious Games Industry for creating custom solutions. I could, for example, create a game for surgeons to practice a particular surgery, while also being able to design and build a suitable controller, that behaves according to customer specifications.

Ideally, I would use love to use some form of _XInput_, which is a modern API for game controllers, effectively allowing them to communicate with any game you can imagine. On top of this, I have been interested in PCB design, so despite the challenges that might bring, I will be attempting to create a dedicated circuit board for the controller.

## The Parts - I'm just a student, after all

Any project needs parts. Whether it's an LED, Integrated Circuit or a full-blown development board, a parts list is a must have for any embedded systems project.

### The easy bit

**_ESP32 WROOM_**

The ESP32 WROOM is a special development board, namely boasting integrated Wi-Fi and Bluetooth. On top of this, it has a faster clock speed, supports up to **18** analog data channels and is widely documented. While I doubt I will need all 18 channels, the faster clockspeed is rather nice to have. I'm not 100% sure if I will end up using Bluetooth, even though I've worked with it plenty in the past.
I will be using the ESP32 DOIT Devkit, as it's cheap and easily available.

**_IMU_**

While an IMU in a controller makes sense for motion controls, I am quite sceptical if I'll have the time and need to implement this. As most games do not care for the orientation nor movement of a controller, it is largely redundant for this project. On top of that, because I have not studied CAD (Computer Aided Design) nor ergonomics, I highly doubt I will be creating something that can be effectively lifted off the desk, at least for now.

### The hard bit

Now for the slightly harder bit. While there are many a controller parts available, I need to figure out how most of them work. Some are rather obvious (the controller buttons), while I have no clue how the triggers on a controller work. After a bit of digging, I found many places which sell replacement parts for controllers, originally intended as DIY repair kits or accessory kits. I've grabbed a set of parts for building a controller (though with a bit of hindsight, realised I have no-where near enough buttons. Thanks ISSD, you won't be getting these back!). This included:

- Joysticks
- Vertical buttons (yes, they stand upright)
- A headphone jack (Not gonna use that)
- A Micro-USB slot (I rather hate micro-USB due to it's fragility)

Even with just the first two parts, I've got a solid base from which to proceed.

**_Joystick  - ALPS 3318_**

After a bit of careful analysis, I found the part number (and manufacturer) of the Joystick, namely the **RKJXV122400R** from Alps Alpine. With a name and part number in hand, I started looking around for the datasheet. To some actual surprise, there was very little information on the manufacturers website regarding the characteristics of the joystick. While there was information for mounting it to a PCB, and the physical dimensions of the joystick, there wasn't anything in regards to the electrical characteristics. I would have to measure this at a later point in time, as I have come across *logarithmic* potentiometers in my time, and not only in audio equipment.

**_Buttons_**

A controller has, well, a fair few buttons. Typically, these are:

- 4 Buttons for the D-Pad (Directional Arrows)
- 4 Buttons for general input (Triangle, Square on PlayStation, A/B on Nintendo & XBox)
- 2 Buttons for the bumpers
- 2 Buttons in the sticks (Are contained)

For the bumpers, I acquired the vertical buttons as mentioned above. Otherwise, regular buttons either acquired via an online retailer, or they would be rather unceremoniously donated by the ISSD. I still had to decide whether I wanted to do software debouncing or hardware debouncing, but that will be explained a bit more later on.

**_Triggers_**

Originally I thought the triggers on controllers were made using some fancy pressure-sensitive switches. Turns out, it's far easier. Due to the potential of continuous wear and tear, switches and potentiometers have made way for HAL effect sensors. These sensors can detect changes in a magnetic field around them, allowing them to effectively operate without physical contact. With that, only the hinge joint on the trigger gets worn down over time, as opposed to the trigger components. While I certainly still could have used potentiometers or pressure sensitive pads (The latter I have used during an interesting Corona-Era project), HAL Effect sensors are quite cheap, and it's something new to learn about.

## The Preparations - Measure twice, design once

### Sensor Measurement

#### VISA Adventures

So, in order to get some nice data to analyse, I decided I wanted to make use of the oscilloscopes available here. After learning about the fact you can stream data from them (I used to take pictures with my phone of the screen), I wanted to make use of that for some nice graphs. Turns out it's not as easy as I thought and it turned into a small sidequest. Due to the sheer length of the article, I've decided to move it to it's own dedicated document [here.](./Personal/Keysight-Visa.md)

#### Joysticks

The joystick consists of a few parts, though only two (technically three) are of importance to this project. These are the two potentiometers and the push-button. While the push-button is self-explanatory as to it's behaviour, the potentiometers may hold some secrets. During a few projects, as mentioned earlier, I've come across both **linear** & **logarithmic** potentiometers. One other key component is the possibility of an inherent **dead zone**. A dead zone is a section where no measurement takes place, either by mechanical or electrical means. Effectively, and action input while within said dead zone, is nullified.

| Name | Test | Test 2 |
| ---- | ---- | ------ |
| Low->Mid| [Measurement Data](./Personal/Controller%20Project/Measurements/dataLow.csv) | ![A rising edge diagram](./Personal/Controller%20Project/Measurements/Joystick-Low.png)|
| Low->Mid, Focused on peak| [Measurement Data](./Personal/Controller%20Project/Measurements/dataLowPeak.csv) | ![A rising edge diagram](./Personal/Controller%20Project/Measurements/Joystick-LowPeak.png)|
| Deadzone| [Measurement Data](./Personal/Controller%20Project/Measurements/dataDeadzone.csv) | ![A diagram showing the deadzone. It is flat in the middle.](./Personal/Controller%20Project/Measurements/Joystick-Deadzone.png)|
| Mid->High| [Measurement Data](./Personal/Controller%20Project/Measurements/Joystick-High.png) | ![A rising edge diagram](./Personal/Controller%20Project/Measurements/Joystick-High.png)|
| Mid->High, Focused on peak| [Measurement Data](./Personal/Controller%20Project/Measurements/dataHighPeak.csv) | ![A rising edge diagram].(/Personal/Controller%20Project/Measurements/Joystick-HighPeak.png)|

From this data, one thing is certain. The potentiometers are (fairly) linear in their function, and can be treated as such. This is nice, because it means there is next to no math required for them to function as the user expects.

One thing to note with the **dead zone** measurement is the fact that there is a brief stop in the middle. I believe this is both **mechanical** and **electrical**, as it feels like there is a spring inside the mechanism to centre the joystick, but continuous movement **did** still result in a significant dead zone. While I don't doubt my results, I will need to test this later.

#### HAL Effect

With the HAL sensor In hand, I went over to the oscilloscope and did my measurements. To my surprise however, I found that the HAL sensor (A3144) didn't show the correct values. While I expected a linear increase when introduced to a strong magnetic field, I instead got a single 1ms pulse.

After doing a bit of reading, it hit me. I bought the wrong sensors. There are two types of HAL effect sensors, Radiometric HAL sensors (they sense and measure the magnetic field) and switching HAL sensors, which send a pulse when introduced to a magnetic field. I bought the latter, which is decidedly **not** what I want. This could have been avoided if I did a bit more careful research, but considering the parts were quite cheap, I'll take the opportunity to learn from my mistakes.

With a bit more searching, I came across the SS49E HAL effect sensor. After double and triple checking that they were the correct ones, I ordered them. Once they arrived, I dropped my other tasks and immediately tested them. As expected, these reacted to the magnetic field based on proximity to the magnet, outputting a higher voltage when it was closer. Now, despite me trying my best, I will admit there might be a significant amount of user error here. While the graph does not show that they are linear, the company behind it, Honeywell, does say they are linear. This, on top of some other online evidence, does point to user error.

![The diagram of the HAL sensor. It looks logaritmic, but should be linear after accounting for user error.](./Personal/Controller%20Project/Measurements/SS49E_HAL.png)

### Button Debouncing

Button Debouncing is where you avoid a button sending multiple signals, by using either software of hardware. Let me explain.

A button, contrary to popular belief, does not provide a clean signal. A button can quite literally bounce multiple times upon being pressed, causing multiple inputs. Despite buttons being considered a binary signal (as they don't charge and simply let electricity flow), this bouncing behaviour can cause erratic behaviour in the device it's attached to.

Typically, there are two main ways of solving this. Software debouncing, where software is used to handle multiple bounces in a given timeframe. This can be done by having a cooldown, or continuously keeping a state of the button. This however, has some significant drawbacks. The system will need to continuously account for this, it reduces system responsiveness and adds a massive software overhead.

Instead, we can take a slightly different approach, namely using a capacitor and resistor. Effectively, this smooths out the charging and discharging of the button, eliminating the problem of the bouncing button entirely. This is typically the preferred way of handling button debouncing, due to not needing to have the processor keep track of button states, which costs valuable time on the processor. Here is a circuit that shows a debounced button.

![A circuit of a debounced button.](./Personal/Controller%20Project/Measurements/Button%20Debounce/DebounceFalstad.png)

And, when properly implemented, you can clearly see a difference between a debounced button and a non-debounced button.

![Two diagrams. The non-debounced button has multiple peaks, while the debounced button rises smoothly](./Personal/Controller%20Project/Measurements/Button%20Debounce/DebounceButtons.png)

## The PCB - All in all, it's quite the brick wall

![The debounced button schematic, now in KiCad](./Personal/Controller%20Project/Measurements/Button%20Debounce/ButtonSchematicKiCad.png)

In order to avoid the absolute spaghetti-tangled mess that is my old schematic drawings, I decided to use the `Label` feature in KiCad. This effectively allows me to connect a set of inputs/outputs, without needing direct lines drawn from one part to the other.

After a bit of googling, I found the footprint for the `ESP32 DoIt Devkit-C` which I use [here](https://gitlab.com/VictorLamoine/kicad.git).

In  order to comply with the license, This product includes software developed by Victor Lamoine. Thank you for making my life easier and not having me meticulously measure the pinout!

![A schematic of the controller.](./Personal/Controller%20Project/Schematic.png)

Converting this schematic by tracing the wires correctly, resulted in the following PCB:

![A PCB Schematic of the controller. Logo, name and ESP32 are present on the board.](./Personal/Controller%20Project/Controller%20Project.png)

## Sources

ESP32 Series Datasheet Version 4.7. (n.d.). https://www.espressif.com/sites/default/files/documentation/esp32_datasheet_en.pdf

Fh, D. (n.d.). SENSITIVE HALL-EFFECT SWITCHES FOR HIGH-TEMPERATURE OPERATION 3141 THRU 3144.

Ganssle, J. G. (n.d.). A Guide to Debouncing. https://my.eng.utah.edu/~cs5780/debouncing.pdf

Honeywell. (n.d.). SS39ET/SS49E/SS59ET Series. Retrieved 19 December 2024, from https://nl.mouser.com/datasheet/2/187/HWSC_S_A0012826248_1-3073340.pdf

Karl-Bridge-Microsoft. (2023a, October 23). Getting Started With XInput in Windows applications—Win32 apps. https://learn.microsoft.com/en-us/windows/win32/xinput/getting-started-with-xinput

Karl-Bridge-Microsoft. (2023b, October 25). Comparison of XInput and DirectInput features—Win32 apps. https://learn.microsoft.com/en-us/windows/win32/xinput/xinput-and-directinput

Mitchel, C. (2015, June 24). 50 555-Circuits. 50 555-Circuits. https://www.talkingelectronics.com/projects/50%20-%20555%20Circuits/50-555Circuits.pdf

Operational Amplifier Basics, Types and Uses| Article | MPS. (n.d.). Retrieved 8 November 2024, from https://www.monolithicpower.com/en/learning/resources/operational-amplifiers

RKJXV122400R Product information | RKJXV Series | Potentiometer Type | Multi Control Devices | Products Search | Products & Technologies | Alps Alpine. (n.d.). Retrieved 8 November 2024, from https://tech.alpsalpine.com/e/products/detail/RKJXV122400R/

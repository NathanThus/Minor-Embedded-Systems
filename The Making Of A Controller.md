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

For the bumpers, I acquired the vertical buttons as mentioned above. Otherwise, regular buttons either acquired via an online retailer, or rather unceremoniously donated by the ISSD would be used. I still had to decide whether I wanted to do software debouncing or hardware debouncing, but that will be explained a bit more later on.

**_Triggers_**

Originally I thought the triggers on controllers were made using some fancy pressure-sensitive switches. Turns out, it's far easier. Due to the potential of continuous wear and tear, switches and potentiometers have made way for HAL effect sensors. These sensors can detect changes in a magnetic field around them, allowing them to effectively operate without physical contact. With that, only the hinge joint on the trigger gets worn down over time, as opposed to the trigger components. While I certainly still could have used potentiometers or pressure sensitive pads (The latter I have used during an interesting Corona-Era project), HAL Effect sensors are quite cheap, and it's something new to learn about.

## The Preparations - Measure twice, design once

### Sensor Measurement

#### VISA Adventures

So, in order to get some nice data to analyse, I decided I wanted to make use of the oscilloscopes available here. After learning about the fact you can stream data from them (I used to take pictures with my phone of the screen), I wanted to make use of that for some nice graphs. Turns out it's not as easy as I thought and it turned into a small sidequest. Due to the sheer length of the article, I've decided to move it to it's own dedicated document [here.](./Personal/Keysight-Visa.md)

#### Joysticks

| Name | Test | Test 2 |
| ---- | ---- | ------ |
| Low->Mid| [Measurement Data](/Personal/Controller%20Project/Measurements/dataLow.csv) | ![A rising edge diagram](/Personal/Controller%20Project/Measurements/Joystick-Low.png)|
| Low->Mid, Focused on peak| [Measurement Data](/Personal/Controller%20Project/Measurements/dataLowPeak.csv) | ![A rising edge diagram](/Personal/Controller%20Project/Measurements/Joystick-LowPeak.png)|
| Deadzone| [Measurement Data](/Personal/Controller%20Project/Measurements/dataDeadzone.csv) | ![A rising edge diagram](/Personal/Controller%20Project/Measurements/Joystick-Deadzone.png)|
| Low->Mid| [Measurement Data](/Personal/Controller%20Project/Measurements/Joystick-High.png) | ![A rising edge diagram](/Personal/Controller%20Project/Measurements/Joystick-High.png)|
| Low->Mid| [Measurement Data](/Personal/Controller%20Project/Measurements/dataHighPeak.csv) | ![A rising edge diagram](/Personal/Controller%20Project/Measurements/Joystick-HighPeak.png)|

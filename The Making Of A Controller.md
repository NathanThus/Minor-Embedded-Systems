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

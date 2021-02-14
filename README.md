#Fiesta-Mk7-Steering-Wheel-Buttons

## Introduction
My Ford Fiesta has media buttons on its steering wheel, but these have no function when using the AUX audio input.
This code adds functionality to these buttons of a mk7 Ford 
Fiesta with the audio package 1. With the correspondent hardware songs 
can be skipped and paused via the AUX cord. Long pressing the prev button
launches the google assistant on android phones. 

## Usage and requirements
An ATtiny45 Microcontroller is used to read inputs from the buttons.
The headset button shorts the function and ground terminal of the AUX cable.
Wiring diagrams and a PCB-design (designed in KiCad) are in the repository.
The directory pics/ includes images that explain which wires in the steering console are tapped.
The electronics are stored beneath the center console at the gear lever.

## Future work
A sleep mode may be added, but isn't necessary depending on the power
source and due to the low energy consumption of the ATtiny45.
Settings may need to be tweaked.

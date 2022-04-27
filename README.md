# ECE2031Project

## Introduction
The purpose of this project is to design a peripheral for controlling NeoPixel LED strip in VHDL. In our peripheral, 
we added functionality to change the behavior of the LED strip, from changing colors of all pixels at once 
to auto-incrementing the lights for any pixel.
We prioritized the minimum viable product, as these are the critical functions that our peripheral should 
do to cover most use cases for the general user and programmer. 
This document serves to highlight the most important functionalities of our peripheral and our design 
process, with any modifications to the peripheral after the project proposal that we have made.
## Device Functionality
The peripheral has four different modes: single pixel 24-bit mode, single pixel 16-bit mode, auto-increment mode, 
and all pixels 16 bit color mode. The user can switch between them by loading the 
memory address 0xB2 with a number 0-2. (Which number is for which mode?). In 24-bit mode there are 
three memory addresses reserved for 8 bits of red, green, and blue. The user must output the 8-bit colors 
to the corresponding red, green, and blue address, followed by a final data output to display the full 24-bit 
RGB color pixel. In single pixel 16-bit mode there is one address reserved. The user inputs a 16-bit color 
in the form of RRRRR-GGGGGG-BBBBB. In auto-increment mode the user inputs a starting address and 
then inputs the colors they want to data. We have also baked in auto-increment functionality such that 
each time they input a color, it will appear on the next pixel. In all pixels 16-bit color mode there is one 
data output reserved. The user simply sends a color to the accumulator and then outputs a “set-all” signal, 
setting all pixels to the necessary color.
## Design Decisions and Implementation
One modification we made was changing how to set all pixels to a 16 bit color. Originally, we did this by 
preventing the memory address where colors are stored from incrementing when in this mode. This would 
make the peripheral increment over all the pixels while reading only the first color in memory, which 
would turn all pixels to that color. This proved to be a problematic implementation because the memory 
map was not corresponding to the actual LED strips, which means that any other additions that we add to 
the LED strip would not be easily shown or modified into RAM, making reading and writing difficult. 
To combat this, we made the “set-all” signal write through all of the memory with the necessary LED 
color instead, but this was slower so we had to add more of a delay to the peripheral for all the writes to 
pass through. 
During our design process, we decided that shifting of pixels would not be as necessary as this would be a 
user-based implementation: the amount of pixels to shift, the beginning and end of shifting, and the speed 
of shifting should be controlled by the user, not the peripheral, and in doing so, we decided to increase the 
efficiency by optimizing processes to make use of spatial locality, making next address block access 
faster. This was done in the auto-increment process, where the user does not have to save the memory 
address every time, preserving speed of usage.
## Conclusions
Overall, our project is a success, providing a capable peripheral to perform multiple actions by the end 
user. With the basic functionality able to be used, we believe our system is modular as well – that is, 
future engineers would be able to use our peripheral and add on additional functions and behaviors that 
suit their needs. 
The design process we followed was quite slow, and workload had to be split more at the end to increase 
efficiency. We believe that our process, if everyone worked on the same on GitHub at once, we would 
have had a better and faster design process. 

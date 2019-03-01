# Symmetry
Visualising Symmetries in the 2D Plane

Using this program:

Download the program file off here.

Installing Processing:
- Visit: https://processing.org/download/ and download the version of processing applicable for your specific operating system

Installing ControlP5 Library
- Visit: http://www.sojamo.de/libraries/controlP5/ 
- Download the controlp5.zip file library from this site.
- Installation: Unzip and extract the file into the processing 'libraries' folder in order to install it. The program will now be able to work.

Current level of implementation:
Out of the 17 existing plane patterns, I have been able to implement the following (12/17):
*442
442
4*2
2*22
*2222
22*
2222
22x
*x
**
xx
o

How to use the program:
1. Select which plane pattern that you would like to draw with.
2. Ensure that you are drawing only in the functional domain outlined in a black polygon on the canvas. The program will not accept any other input.
3. The user is also able to modify what colour they are using to draw with. Use the sliders on the right in order to change the colour.
4. As long as the user is drawing in the correct fundamental domain, the users input will be replicated over the canvas.

Currently working on the more complex patterns that involve more complex calculations in regards to rotation etc. I found that this was rather challenging, and despite developing some frameworks for it, such as a rotatePoint() function, which uses an expanded rotation matrix to rotate points by a given angle. Will be continuing work on this in my spare time and hopefully finish this application at a later date.
Challenges I faced while working on the project:
- Creating a usable GUI, I found this difficult as I originally didn't want to use any external libraries to write my code but unfortunately due to time constraints and how difficult it was proving, I used a library called ControlP5 in order to contrust the GUI.
- Learning how to reflect / rotate / translate coordinates in order to create the image. I had to learn a fair amount about how to manipulate the coordinates that I had in order to reflect and rotate the fundamental symmetry domain in order to fill the 800x800 space correctly.
- Rotating by angles that are not a multiple of 90˚. With the help of my supervisor, I created a function that rotates a point in the plane by a certain angle. However, it was still very hard to use this, as I also want to translate the point to another point in the plane and this was an extra challenge that was proved to be a bit too hard for me, although I intend to keep working on it.
- Setting up the colour picker was also a bit of a challenge for me, as using the library was a bit of a new thing to me.
- I'd never actually written in this particular language before, so I had to go through a lot of documentation just to get started in the project, which I felt set me back a bit. 
- Flow of the project. With the way that Processing works, there is a function draw() that is continuously executed. Getting the flow of my program right so that different states did not interact with each other was a bit of a challenge initially.

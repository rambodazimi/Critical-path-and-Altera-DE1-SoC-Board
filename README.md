# Critical-path-and-Altera-DE1-SoC-Board

<h3>Description</h3>

<h4>Critical Path of Digital Circuits</h4>

In this part, you will learn how to use the Quartus CAD tool to determine the delay of a given path in digital circuits. To this end, in this section, we use the ripple-carry adder circuit as the “circuit under examination”.

In this approach, our search for the critical path will now be limited to the violating paths. Examining the violating paths in the “Timing Analyzer” tool will, therefore, determine the critical path.

<h4>BCD to 7-Segment LED Decoder</h4>

A 7-segment LED display includes 7 individual LED segments, as shown below. By turning on different segments together, we can display characters or numbers. There are six of these displays on the DE1-SoC board, which you will use later to display the result of your full implementation of the adder.

We will need a circuit to drive the 7-segment LEDs on the DE1 board, called 7-segment decoder. It takes as input a 4-bit BCD-formatted code representing the 10 digits between 0 and 9, and generates the appropriate 7-segment display associated with the input code. For many LED displays, including the ones on the DE1 board, segments turn on when their segment inputs are driven low, that is “0” means on and “1” means off. This scheme for the inputs is called “active low.” The VHDL code for the 7 segment decoder is provided below.

<h4>Wrapper Design</h4>

In this part of the lab, you will design a circuit (that is called “wrapper” circuit) that performs addition of two 4-bit BCD-formatted inputs A and B, and displays the inputs as well as the result of the addition in BCD format using the 7-segment LEDs on the DE1-SoC board. You will need, therefore, to use four 7-segment LEDs on the board: the first two 7-segment LEDs will be used to display the inputs A and B, while the other two 7-segment LEDs will be used to display the result of the addition. We need two LED displays for the output as the result may be two BCD digits long. Note that you should use the binary-to-7-segment LED decoder to obtain appropriate 7-segment display codes.

The wrapper circuit has two 4-bit inputs, A and B, each representing a BCD digit. The outputs are: a 7-bit
display code for A, a 7-bit display code for B, and two 7-bit display codes for the sum A+B.

<h4>Testing the Wrapper on the Altera Board</h4>

Since you will now be working with an actual device, you have to consider to which device package pins (physical pins) the various inputs and outputs of the project are connected. The FPGA chip on the board communicates with the outside world by sending and receiving binary signals using physical pins. You can think of these pins as the ports of an VHDL entity. Some of the input pins are connected to the sliding switches on the board, and some of the output pins are connected to the LED displays. In particular, you will want to connect the LED segment outputs from the instances of the seven_segment_decoder circuit (i.e., the outputs of the wrapper circuit) to the corresponding pins of the four 7-segment LED displays on the board. See Section 3.6.2 of the DE1-SoC User Manual. The mapping segments of the each 7-segment LED on the board to the pins on the Cyclone FPGA device, is listed in Table 3-9 on page 27 of the DE1-SoC User Manual.

You will also want to connect, for testing purposes, four of the slide switches on the DE1-SoC board to the input A, and another four switches to the input B of the wrapper circuit. See Section 3.6.1 of the DE1-SoC User Manual. The mapping of the slide switches to the FPGA pins is listed in Table 3-6 on page 25 of the DE1-SoC user manual.

You must now notify the compiler to which pins the input and output signals of your wrapper circuit should be connected. For example, if B[0] is connected to switch SW0 (See Fig. 3-15 of the manual on page 24), you should notify the compiler that B[0] is assigned to pin PIN_AB12. You specify the pin assignments for your inputs and outputs by using the Pin Planner, which can be done by choosing the Pins item in the Assignments menu. See example below. Note that this figure is just an example, and does not correspond to the wrapper circuit that you are supposed to design in this assignment.

Once you have assigned all of the inputs and outputs of your circuit to appropriate device pins, re-compile your design. Your design is now ready to be downloaded to the target hardware. You may want to go over Section 4.1 of the DE1-SoC user manual for information on configuring (programming) the Cyclone V FPGA on the board. You will be using the JTAG mode to configure the device. Take the board out of the kit box, connect the USB cable to the USB port of the computer and to the USB connector on the board. Next, select the Programmer item from the Tools menu. Click Auto Detect and then select the correct device (5CSEMA5), as shown below. Both FPGA device and HPS should be detected.

Next, double-click the FPGA device (5CSEMA5), from the window that pops up, add the .sof file created by Quartus. Finally, check the “Program/configure” box beside the 5CSEMA5 device, and then click “Start”. See also Section “Configuring the FPGA in JTAG Mode” on p. 12 of the manual. Now, you should be able to use the slide switches to insert values for inputs A and B. The 7-segment LEDs should also display inputs and outputs in BCD format.

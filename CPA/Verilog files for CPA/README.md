Here are files to be added to the AES verilog files to perform the CPA attack.
1. "CPA_input_AES.v" input a certain key to be cracked and the known plaintext inputs, in order to perform the CPA.
2. "PLL.v" Provides a clock-generation circuit inside a Cyclone IV E FPGA. It takes in an input clock (inclk0) and produces an output clock (c0) with a different frequency or phase relationship. The locked output indicates when the PLL has locked onto the input clock. property of Altera corportaion.
3. "PLL_bb.v" is a pure blackbox version of the PLL.v
4. "SevenSegmentDigits.v" translates an input of 0-15 to a hex representation on a 7 segment screen of the FPGA device, for testing during a run
5. "debounce.v" used to debounce. During testing, some keys got skipped because of flactuation during switching, so the debounce was used to make sure they don't get skipped
6. "top_AES_input" is used to input the values from "CPA_input_AES.v" into the AES program (changed from the tests before)

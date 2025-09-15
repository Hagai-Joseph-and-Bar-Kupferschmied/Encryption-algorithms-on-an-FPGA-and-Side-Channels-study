AES implementation. Uses 128 bit key to encrypt a 128 bit message in the AES standard. 
In this folder are the program files and the TB for each program file and the system as a whole.
The files are as followed:
1. addRoundKey.v: adds the round key to the data, part of AES round
2. AES_Encrypt.v: Module for performing the AES encryption process, uses the sub-modules (mostly encryptRound) and is responsible for round managment
3. ASCII_DEC.v: translated a number from 0 to 15 ro ASCII representation. For UART transmition.
4. baud_rate_gen.v: generated the needed BAUD rate for the UART.
5. clk_delay.v: used to delay the clock for AES and UART control when testing
6. encryptRound.v: responsible for each individual round. Uses the submodules listed to do so.
7. KeySbox_input_AES, GFSbox_input_AES.v: one of the modules with different input values keys and data to test the AES algorithm.
8. KeyExpansion.v: Used at the start of the AES encryption to generate the needed key values for each round
9. mixCollums.v: basic module of AES round. Each column of the state is treated as a four-term, polynomial and multiplied by a fixed polynomial matrix in GF(2^8)
10. sbox.v: Replaces an input byte with a predetermined byte (one for each possible input) in a non-linear way.
11. shiftRows.v: basic module of AES round. shifts each row. first by 0 bytes, second by 1, third by 2 and fourth by 3.
12. subbytes.v: basic module of AES round. replaces all bytes in the input matrix in a predetermined and non-linear way. uses sbox.v on each byte at the same time.
13. top_AES_input.v: An interface to allow easy checking of the system on the FPGA device, using a preselected input module. connects all relevant modules for encryption and uart interface.
14. transmitter_bau.v: Module transmits UART data from an FPGA
 Inputs: clk, the internal clock of the FPGA (50MHz)
 reset, resets the transmitter to it's initial state
 transmit, transmitter only operates if this bit is on
data, the data to be transmitted
 Output: TxD, the serial output
15. GFSbox_input_AES.v: Test case, differing plaintext. Required by NIST.
16. VarKey_input_AES.v: Test case, differing keys. Required by NIST.
17. VarTxt_input_AES.v: Test case, differing plaintext. Required by NIST.

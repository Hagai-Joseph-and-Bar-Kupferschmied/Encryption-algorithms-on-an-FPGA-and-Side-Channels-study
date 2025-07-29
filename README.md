# AES Encryption algorithms on a FPGA and Side Channels study
For a side channel attack study on a FPGA device, we connected a scope with a current probe to the power cord a DE2-115 FPGA device. In this project are the code pieces needed to create the encryption, use the data for the attack and test all parts. These are divided to 4 main parts:
1. FPGA AES encryption implementation. made in accordance to the 128 bit key standard.
2. CPA (correlation power analisys) code. Uses current samples to estimate the most probable key. 
3.  A psudo random number generator, for key generation
4.  UART adjusments for testing

In each folder are more detailed READMEs.

In this directory are files related to the CPA.
- In "CPA files from 1607/2606" are specific plaintexts we used to perform the CPA, in forms that are easy to input to the system and later use in the CPA.
- In "CPA_PIC_1607/2606" are runs of the CPA, showing the corrleation found for each byte of the key with every possibilty.
- In "Verilog files for CPA" are the running files for the CPA, further explained in their README
- "CPA.m" is used to create the correlation graphs we saw in "CPA_PIC"
- "CPA.py" performs the actual attack. Step 1: Perform the current measurements on many known plain texts using the same key.
 Step 1: Perform the current measurements on many known plain texts using the same key.

 Step 2: For the first key byte: 
 Guess a byte, Finds the hypothetical power for this byte using Hamming Weight. Then repeats for all possible bytes (0x00, 0x01, ... , 0xFF)
 
 Step 3: Correlate the hypothetical power with the measurements. The correct byte key guess will show a
high correlation at the time sample(s) where the device processes that byte (e.g., S-box operation).
Repeat step 2 and step 3 for all the byte keys (16 bytes in total).
From each round we get a guessed byte key and the time is has been processed.
- "SBOX.mat" is a starndard s-box in .mat format.
- "gen.py" is used to generate a set of different 128 bit keys.
- "gen_new.py" does the same thing but also print them in form that can be inputed to verilog code. 


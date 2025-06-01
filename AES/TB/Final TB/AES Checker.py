# This code compare the expected values of the cypher text to the cypher text received (in our case,
# from UART connection) and saved in a file. The 'AES_CYPHER_EXPECTED_OUTPUT.txt' file contain all the expected cypher
# values from the AESAVS - NIST.pdf file. The expected values are numbered from 0 to 183 and are corresponded to the
# plain text and cypher keys that in the Verilog file - 'input_AES.v'.
import re

expected_list = []

with open('UART_AES_CYPHER_OUTPUT.txt', 'r') as f:
    # Change as require: UART_AES_CYPHER_OUTPUT_FROM_GFSbox_TEST.txt, UART_AES_CYPHER_OUTPUT_FROM_KeySbox_TEST.txt,
    # UART_AES_CYPHER_OUTPUT_FROM_VarTxt_TEST.txt, UART_AES_CYPHER_OUTPUT_FROM_VarKey_TEST.txt
    hex_str = f.read().strip().upper()

pattern = re.compile(r'^(\d+)\.\s*([0-9a-fA-F]{32})$')
with open('AES_CYPHER_EXPECTED_OUTPUT_KeySbox.txt', 'r') as f:
    # Change as require: AES_CYPHER_EXPECTED_OUTPUT_GFSbox.txt, AES_CYPHER_EXPECTED_OUTPUT_KeySbox.txt,
    # AES_CYPHER_EXPECTED_OUTPUT_VarTxt.txt, AES_CYPHER_EXPECTED_OUTPUT_VarKey.txt
    for line in f:
        match = pattern.match(line.strip())
        if match:
            idx, hex_val = match.groups()
            expected_list.append((idx, hex_val.upper()))

for idx, hex_val in expected_list:
    if hex_val in hex_str:
        print(f"Passed cypher test no.{idx}!")
    else:
        print(f"Didn't pass cypher test no.{idx}.")

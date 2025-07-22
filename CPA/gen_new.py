import random
import numpy as np
import pandas as pd

my_random_txt = np.load('plain_txt.npy', allow_pickle=True)  # allow_pickle is needed for non-array objects like lists

my_random_txt = my_random_txt.tolist()

# i = 1

# print("Tested items: ")

# for item in my_random_txt:
#    print("item ", i, ": ", item)
#    i += 1

i = 0
while i <= 100:
    randint = random.getrandbits(128)
    randstr = f'{randint:032x}'
    assign_str = f"{i} : plainText = 128'h{randstr};"
    if randstr not in my_random_txt:
        my_random_txt.append(randstr)
        print(assign_str)
        i += 1
arr = np.array(my_random_txt)
np.save('plain_txt_new.npy', arr)
df = pd.DataFrame(arr, columns=['Values'])
df.to_excel('my_trace_new.xlsx', index=False)

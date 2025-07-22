import random
import numpy as np
import pandas as pd

my_random_txt = []
i = 0
while i <= 100:
    randint = random.getrandbits(128)
    randstr = f'{randint:032x}'
    if randstr not in my_random_txt:
        my_random_txt.append(randstr)
        print(randstr)
        i += 1
arr = np.array(my_random_txt)
np.save('plain_txt.npy', arr)
df = pd.DataFrame(arr, columns=['Values'])
df.to_excel('my_trace.xlsx', index=False)




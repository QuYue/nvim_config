#%% 
import numpy as np
 
#%%
a = np.ones(1)
b = np.ones(2)  
c = np.zeros(3)
if True:
    print(1)

#%%

#%%：

#%% Hello 
print(10)

#%%
import tqdm as tqdm
import time
for i in tqdm.trange(10):
    time.sleep(1)

#%%
import torch
t = torch.ones(10)
print(t)

#%% 
import pandas as pd
a = pd.DataFrame(data=[[1,2,3],[3,2,1]])
print(a)

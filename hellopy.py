#tutorial numpy
import numpy as np
#print(np.__version__)

# a = np.array([1,2,3])
# print(a)
# print(a.shape)
# print(a.dtype)
# print(a.ndim)
# print(a.size)
# print(a.itemsize) #bytes
# print(a[0]) #1st element 

# b = a * np.array([2,0,2])
# print(b) 

l = [1,2,3]
a = np.array([1,2,3]) 

print(a)

'''
l.append(4) #list
l = l + [4] 
a.append(4) #error
a = a + np.array([4]) #somma 4 a tutti elementi (broadcasting)
print(l)
print(a)
'''


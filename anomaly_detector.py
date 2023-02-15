
import numpy as np
from numpy.core.numeric import (
    asanyarray, arange, zeros, greater_equal, multiply, ones,
    asarray, where, int8, int16, int32, int64, intp, empty, promote_types,
    diagonal, nonzero, indices
    )
from numpy.linalg import eigvals, lstsq, inv

''' takes x,y,deg,Isin. X and Y are numpy array. function returns optimized parameters and y_pred'''

def curve_fitter(x,y,deg=0,Isin=False):
    
    if Isin == True:
        n = deg+2
    else: 
        n = deg+1
    
    tmp = np.ones((len(x),n))
    for i in range(1,n):
        tmp[:,i] = x

    tmp = multiply.accumulate(tmp,axis=1)
    if Isin == True:
        tmp[:,-1]= np.sin(x)
    else: pass
    
    c_opt = lstsq(tmp,y)[0]
    y_pred =np.matmul(tmp,c_opt)
    
    return c_opt, y_pred
  
#uncomment the following codes to test the above function
# import matplotlib.pyplot as plt
# a=[1,2,3,4,5,6,7,8,9,10]
# b=[1,8,27,64,12,8,3,-2,3,5]
# c, y_pred = curve_fitter(a,b,6,False)
# print(c)
# print(y_pred)
# plt.plot(a,b,'*g',a,y_pred,'-r')
# plt.show()

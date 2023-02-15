# ACI_MLE
Projects Implemented during working as MLE at ACI Center


`frame_accum.py`: The code is to leverage direct feed from ip cameras of outlet and store data in a pickle file from where `load_views.py` load the images. This is basically Continuous access of ip cameras listed in csv and stores one time stepwise view in a dictionary to avoid network interruption 


`anomaly_detector.py` includes a function `curve_fitter` that fits a data distribution and return the fitted parameters which can be used for anomaly detection 

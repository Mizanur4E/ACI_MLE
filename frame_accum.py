import pandas as pd
import cv2
import numpy as np
from tqdm import tqdm
import time
import pickle
from datetime import datetime

'''Continuous access of ip cameras listed in csv and stores one time stepwise view in a dictionary to avoid network interruption.'''
def single_frames_extractor(_links, _n_camera):

    frames = []
    for i in tqdm(range(_n_camera)):
        cap = cv2.VideoCapture(_links[i])
        ret, frame = cap.read()
        if ret:
            # cv2.imshow('frame',frame)
            # cv2.waitKey(0)

            frames.append(frame)
        else:
            print('No frame..',i)

    return frames

if __name__=="__main__":

    outlet_name = 'Gulshan02'
    video_df = pd.read_csv(f'{outlet_name}.csv')
    links = video_df['RTSP_link'].to_list()
    n_camera = len(video_df)

    #run the following lines for infinite
    while True:
        f_name = 'HeatMap_Gulshan02'+str(datetime.now())
        file = open(f_name,'wb')
        data = {}
        for i in range(120):
            view_t = single_frames_extractor(links,n_camera)
            key = str(datetime.now())
            data[key]= view_t
        pickle.dump(data,file)
        file.close()


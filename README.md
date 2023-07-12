# ACI_MLE
Projects Implemented during working as MLE at ACI Center


`frame_accum.py`: The code is to leverage direct feed from ip cameras of outlet and store data in a pickle file from where `load_views.py` load the images. This is basically Continuous access of ip cameras listed in CSV and stores one-time stepwise view in a dictionary to avoid network interruption 


`anomaly_detector.py` includes a function `curve_fitter` that fits a data distribution and returns the fitted parameters which can be used for anomaly detection 


`metesre.py` and a similar name notebook is the neural model designed for Amazon KDD Cup'23. The object contains a full pipeline to preprocess the dataset, train the model, inferencing, and export test rest in binary file for submission/future usage purposes.

`FFPS_ROI_CorrMat.ipynb` contains an analysis to find the significance of different factors on return on investment (ROI). Three different algorithm have been explored for the correlation purpose.

`SQL_test_mis_aci_mmr_nayan.sql` contains solutions to problems provided during the SQL skill test.


## Journey Outcome @ACI_MLE

- MS SQL (Data fetching, Analysis, Master Table Building from DB)
- Django with REST framework (Live face recognition API, example recipe app)
- Logistics Data Analysis and Insight Generation (seasonality, correlation, Anomaly, churning, emerging, loyalty etc)
- Outlet Video Processing: On-the-fly face recognition and identification (Live Identification, Facing the non-ideality: Multi face Issue, Confusion with the same person, Confidence threshold tuning)
- Factory visit: Yamaha - Bike Assembly Line (Chassis Number Detection), Flour (Truck Monitoring System)
- Statistical Chatbot (Extractor and Generator)
- Web Scrapping (MedEx Medicine Database, Newspaper, Bengali Literature Database)
- Mapbox (Making a Mapbox object- Bangladesh map- Division to Union Level) 
- Heatmap (Building data pipeline: Camera to Analyzer, feed discrete frames from the outlet cameras instead of the continuous frame to reduce time overhead and memory usage and overcome internet issues)
- Region-wise Doctor's Top Medicine recognition from hand-written prescription 
- Product Recognition (Market presence understanding from field force provided shop's picture, used YOLO model, have to annotate data for model training)
- Amazon KDD Cup: Next Product Recommendation Model (Data processing pipeline, Model Training Pipeline, Model Inferencing, and Server compatible Data Generation Pipeline)











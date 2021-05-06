# SherLock, Malware Detection in Androids without Root Privileges

We present a classification model trained to detect whether a malicious application is actively running on a user’s Android smartphone based on highly granular and low-privilege hardware performance counters (HPCs) and packet exchange information collected over the course of 3 months across 46 devices in 2016.
People are using cell phones for an increasing number of tasks, including as banking, e-mail, 3rd party app sign-on authentication, and smart device management. Many of these tasks require the user to store personal data which takes the form of passwords, contact information, photos, and more on their phone. Malicious actors seek to steal this valuable information on Android devices through hidden apps and Trojans found on the Google Play store and shared through SMS messaging.
Our model accepts statistics on five seconds of CPU usage and internet traffic packet exchange information as input to detect whether malware is actively running on the device, meaning that the implementation of the application does not require root privileges to support user security, and can be utilized across different types of devices.

## To get started:
First download: t4_mor_join.ipynb
You should be in a PySpark docker image to do the following!
If you're not in PySpark, please run the following (presuming you have docker installed)

!docker run -it --rm -p 8888:8888 jupyter/pyspark-notebook

If you need help, check out [this link](https://medium.com/@suci/running-pyspark-on-jupyter-notebook-with-docker-602b18ac4494)
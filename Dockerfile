FROM nvcr.io/nvidia/tensorflow:21.03-tf2-py3
RUN apt-get update \
 && pip install pandas \
 && pip install scikit-learn \
 && pip install matplotlib  
CMD ["jupyter", "notebook","no-browser","ip=0.0.0.0","allow-root","NotebookApp.token=","notebook-dir=/nfs/"]

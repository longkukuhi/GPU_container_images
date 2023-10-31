FROM nvcr.io/nvidia/pytorch:23.10-py3
RUN pip install scikit-learn \
 && pip install matplotlib \
 && pip install numpy \ 
 && pip install scipy \
 && pip install opencv-python \
 && pip install notebook==6.3.0
CMD ["jupyter", "notebook","no-browser","ip=0.0.0.0","allow-root","NotebookApp.token=","notebook-dir=/nfs/"]

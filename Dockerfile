FROM nvcr.io/nvidia/pytorch:24.07-py3
RUN apt-get update \
 && pip install scikit-learn \
 && pip install matplotlib \
 && pip install numpy \ 
 && pip install scipy \
 && pip install opencv-python \
 && pip install transformers \
 && pip install sentencepiece \
 && pip install notebook==6.3.0
CMD ["jupyter", "notebook","no-browser","ip=0.0.0.0","allow-root","NotebookApp.token=","notebook-dir=/nfs/"]

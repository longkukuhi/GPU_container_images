FROM nvcr.io/nvidia/pytorch:21.02-py3
RUN apt-get update \
 && pip install scikit-learn \
 && pip install matplotlib \
 && pip install pytorch_lightning==1.5.5 \
 && pip install transformers==4.8.1 \
 && pip install Pillow==8.3.1 \
 && pip install tqdm==4.53.0 \
 && pip install ipdb==0.13.7 \
 && pip install einops==0.3.0 \ 
 && pip install pyarrow==2.0.0 \ 
 && pip install sacred==0.8.2 \
 && pip install pandas==1.1.5 \ 
 && pip install timm==0.4.12 \
 && pip install torchmetrics==0.7.3 \
 && pip install fairscale==0.4.0 \
 && pip install numpy \ 
 && pip install scipy \
 && pip install opencv-python \
 && pip install notebook==6.3.0
CMD ["jupyter", "notebook","no-browser","ip=0.0.0.0","allow-root","NotebookApp.token=","notebook-dir=/nfs/"]

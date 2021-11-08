FROM nvcr.io/nvidia/tensorflow:21.07-tf2-py3
RUN apt-get update \
 && apt-get install -y wget \
 && wget https://repo.anaconda.com/miniconda/Miniconda3-py37_4.10.3-Linux-x86_64.sh \
 && bash Miniconda3-py37_4.10.3-Linux-x86_64.sh -b \
 && export PATH=/root/miniconda3/bin/:$PATH \
 && echo "export PATH=/root/miniconda3/bin/:$PATH" >> /root/.bashrc \
 && conda install -y pytorch torchvision torchaudio cudatoolkit=11.3 -c pytorch \
 && conda install -y pandas \
 && conda install -y scikit-learn \
 && conda install -y matplotlib \
 && conda install -y -c conda-forge jupyterlab \
 && conda install -y tensorflow \
 && conda install -y spacy 
CMD ["jupyter", "notebook","no-browser","ip=0.0.0.0","allow-root","NotebookApp.token=","notebook-dir=/nfs/"]

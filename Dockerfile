FROM nvidia/cuda:11.4.2-cudnn8-runtime-ubuntu20.04
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
 && conda install -y spacy \
 && ENV PATH="/root/miniconda3/bin/:/root/miniconda3/bin/:/usr/local/nvidia/bin:/usr/local/cuda/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
CMD ["jupyter", "notebook","no-browser","ip=0.0.0.0","allow-root","NotebookApp.token=","notebook-dir=/nfs/"]

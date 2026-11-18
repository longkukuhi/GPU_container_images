# PyTorch GPU container image

A Docker recipe for numerical computing and computer vision notebooks. It extends NVIDIA’s `nvcr.io/nvidia/pytorch:24.07-py3` image with scikit-learn, Matplotlib, NumPy, SciPy, OpenCV, Transformers, SentencePiece and Jupyter Notebook 6.3.0. Dependency versions are defined in the [Dockerfile](Dockerfile), with most additions resolved at build time.

## Build and inspect

From the directory containing the Dockerfile, build a local image and print the PyTorch version inside it.

```sh
docker build -t gpu-notebooks:local .
docker run --rm gpu-notebooks:local python -c "import torch; print(torch.__version__)"
```

On a host configured for NVIDIA GPU containers, the following check prints whether PyTorch can see CUDA inside the container.

```sh
docker run --rm --gpus all gpu-notebooks:local python -c "import torch; print(torch.cuda.is_available())"
```

## Use a notebook locally

Run this from the directory containing the notebooks you want to edit. It mounts that directory at `/nfs` and publishes Jupyter only on the host's loopback interface.

```sh
docker run --rm -it --gpus all \
  -p 127.0.0.1:8888:8888 -v "$PWD:/nfs" \
  gpu-notebooks:local jupyter notebook \
  --no-browser --ip=0.0.0.0 --allow-root --notebook-dir=/nfs
```

Open the tokenized URL printed by Jupyter using `localhost:8888` on the host. The command supplies the option prefixes explicitly and leaves Jupyter's token authentication enabled. Files saved under `/nfs` persist in the mounted host directory.

FROM nvidia/cuda:11.6.0-cudnn8-devel-ubuntu20.04

LABEL maintainer "Mark - Auto generated"

ENV DEBIAN_FRONTEND=noninteractive

# Create /code folder on docker container
WORKDIR /code

# Copy all the files from current folder to /code folder
COPY . /code

# Install Python and pip
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    unzip
    
RUN rm -rf /var/lib/apt/lists/*

# Install Python dependancies from requirements.txt file    
RUN pip3 install -r requirements.txt

RUN mkdir -p /data
 
# Download data and model checkpoints
RUN gdown -O ../data/train_val_test.zip "https://drive.google.com/uc?id=1q0KKk1pMM-dxYmq2pxgiv14_ev8j8nII" 

RUN unzip ../data/train_val_test.zip 
#rm ../data/train_val_test.zip 

CMD bash -c 'bash'

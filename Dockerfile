# # FROM python:3.9
# # FROM nvidia/cuda:12.1.1-devel-ubuntu22.04
# FROM nvidia/cuda:11.0.3-cudnn8-devel-ubuntu18.04

# RUN apt-get update && apt-get install ffmpeg libsm6 libxext6  -y


# # # ENV LD_LIBRARY_PATH /usr/local/nvidia/lib64

# RUN apt-get update && apt-get install -y python3-pip




# RUN pip3 install --upgrade pip

# WORKDIR /usr/src/app

# COPY requirements.txt ./
# RUN apt-get update && pip install --no-cache-dir -r requirements.txt

# RUN apt-get update && apt-get install git -y

# RUN git clone https://github.com/Vegetebird/MHFormer.git --recursive

# COPY model_4294.pth /usr/src/app/MHFormer/checkpoint/pretrained/
# COPY pose_hrnet_w48_384x288.pth /usr/src/app/MHFormer/demo/lib/checkpoint/
# COPY yolov3.weights /usr/src/app/MHFormer/demo/lib/checkpoint/

# COPY . .

# # RUN apt-get update && apt-get install nano gedit -y


# # # RUN sudo apt-get update \
# # #     && sudo apt-get install -y nvidia-container-toolkit-base
# # # RUN apt-get update && apt-get install -y --no-install-recommends  cuda


# # RUN apt-get update && apt-get install -y nvidia-container-toolkit

# CMD ["\bin\bash"]

# # # CMD [ "python", "./your-daemon-or-script.py" ] 



# FROM nvidia/cuda:12.1.1-devel-ubuntu22.04




############################
# Docker file for PoseFormer2
############################

FROM nvidia/cuda:12.0.0-cudnn8-devel-ubuntu22.04


RUN apt-get update && apt-get install ffmpeg libsm6 libxext6  -y


# # ENV LD_LIBRARY_PATH /usr/local/nvidia/lib64

RUN apt-get update && apt-get install --no-install-recommends --assume-yes -y python3-pip  

RUN pip3 install --upgrade pip

WORKDIR /usr/src/app

COPY requirements.txt ./
RUN apt-get update && pip install --no-cache-dir -r requirements.txt

RUN apt-get update && apt-get install git -y

# RUN git clone https://github.com/Vegetebird/MHFormer.git --recursive

# RUN rm /usr/src/app/MHFormer/demo/vis.py

# COPY MHFormer/demo/vis.py /usr/src/app/MHFormer/demo/


# COPY model_4294.pth /usr/src/app/MHFormer/checkpoint/pretrained/351/
# COPY pose_hrnet_w48_384x288.pth /usr/src/app/MHFormer/demo/lib/checkpoint/
# COPY yolov3.weights /usr/src/app/MHFormer/demo/lib/checkpoint/

COPY . /usr/src/app/PoseFormerV2


# RUN chmod +w /usr/src/app/MHFormer/demo/vis.py


CMD ["\bin\bash"]
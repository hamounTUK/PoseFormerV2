

xhost +local:root

docker run -it --rm -v '/dev/bus/usb':'/dev/bus/usb' \
    -v '/home/heidarshenas/git/PoseFormerV2:/usr/src/app/PoseFormerV2' \
    --network=host \
    --privileged \
    --env="DISPLAY" \
    --env="QT_X11_NO_MITSHM=1" \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    --gpus all --runtime=nvidia\
    vi-poseformerv2 bash
    
export containerId=$(docker ps -l -q)
    
xhost -local:root 


    # --volume="/home/heidarshenas/git/MHFormer/:/usr/src/app/MHFormer/demo/"  \

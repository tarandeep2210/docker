#!/bin/sh
echo "The time is: $(date)"

# Run comfyUI
echo "Starting facefusion..."

# cd /workspace/ComfyUI
# python facefusion.py run --open-browser 

python3.10 facefusion.py run &

echo "facefusion started successfully"

# use below if docker container stops after restart
sleep infinity
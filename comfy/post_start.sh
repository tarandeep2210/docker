#!/bin/sh
echo "The time is: $(date)"

# Run comfyUI
echo "Starting ComfyUI..."

# cd /workspace/ComfyUI
python3 main.py --listen 0.0.0.0 --port 8190 --disable-auto-launch --disable-metadata &

echo "ComfyUI started successfully"

# use below if docker container stops after restart
sleep infinity
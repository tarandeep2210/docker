#!/bin/sh
echo "The time is: $(date)"

# Start code-server
echo "Starting code-server..."
code-server --auth none --port 8189 --host 0.0.0.0 &
echo "Code-server started successfully"


# Run comfyUI
echo "Starting ComfyUI..."

# cd /workspace/ComfyUI
python3 main.py --listen 0.0.0.0 --port 8190 --disable-auto-launch --disable-metadata &

echo "ComfyUI started successfully"

# use below if docker container stops after restart
sleep infinity
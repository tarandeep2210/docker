#!/bin/sh
echo "The time is: $(date)"

# Run comfyUI
echo "Starting ComfyUI..."

# cd /workspace/ComfyUI
python3 /workspace/Comfyui/main.py &

echo "ComfyUI started successfully"
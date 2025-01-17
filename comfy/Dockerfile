FROM runpod/pytorch:2.4.0-py3.11-cuda12.4.1-devel-ubuntu22.04

ENV PYTHONUNBUFFERED=1
ENV DEBIAN_FRONTEND=noninteractive

# WORKDIR /workspace

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    git curl && \
    rm -rf /var/lib/apt/lists/*

    # Clone the ComfyUI repository
RUN git clone https://github.com/comfyanonymous/ComfyUI.git /workspace/ComfyUI

WORKDIR /workspace/ComfyUI

# Install Python dependencies
RUN pip3 install --upgrade pip && pip3 install -r requirements.txt

# manager
RUN git clone https://github.com/ltdrdata/ComfyUI-Manager.git custom_nodes/ComfyUI-Manager

# Expose the default ComfyUI port
EXPOSE 8188

# Start Scripts
COPY post_start.sh /post_start.sh

RUN chmod +x /post_start.sh

SHELL [ "/bin/bash", "-c" ]
CMD [ "/post_start.sh" ]


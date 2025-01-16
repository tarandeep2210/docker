FROM runpod/pytorch:2.4.0-py3.11-cuda12.4.1-devel-ubuntu22.04

ENV PYTHONUNBUFFERED=1
ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /workspace

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    git curl && \
    rm -rf /var/lib/apt/lists/*

    # Clone the ComfyUI repository
RUN git clone https://github.com/comfyanonymous/ComfyUI.git /ComfyUI

WORKDIR /ComfyUI

# Install Python dependencies
RUN pip3 install --upgrade pip && pip3 install -r requirements.txt

# Expose the default ComfyUI port
EXPOSE 8188

# Command to run ComfyUI
# CMD ["python3", "main.py"]

# Start Scripts
COPY start.sh /start.sh

RUN chmod +x /start.sh

SHELL [ "/bin/bash", "-c" ]
CMD [ "/start.sh" ]
FROM nvidia/cuda:12.3.2-cudnn9-runtime-ubuntu20.04

ARG FACEFUSION_VERSION=3.0.0
ENV GRADIO_SERVER_NAME=0.0.0.0

WORKDIR /facefusion

# Install dependencies, including curl, and add deadsnakes PPA for Python 3.10
RUN apt-get update && \
    apt-get install -y software-properties-common curl && \
    add-apt-repository ppa:deadsnakes/ppa && \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
        python3.10 \
        python3.10-venv \
        python3.10-dev \
        git \
        ffmpeg && \
    rm -rf /var/lib/apt/lists/*


    

    

# Install pip using get-pip.py with curl
RUN curl -sS https://bootstrap.pypa.io/get-pip.py | python3.10

# Set Python 3.10 as default
RUN update-alternatives --install /usr/bin/python python /usr/bin/python3.10 1 && \
    update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.10 1

# Verify Python and pip installation
RUN python --version
RUN python3 --version
RUN python3.10 -m pip --version

# Clone the FaceFusion repository
RUN git clone https://github.com/facefusion/facefusion.git --branch ${FACEFUSION_VERSION} --single-branch .

# Upgrade pip and ensure correct package index
RUN python3.10 -m pip install --upgrade pip setuptools wheel && \
    python3.10 -m pip config set global.index-url https://pypi.org/simple

# Install requirements
RUN python3.10 -m pip install -r requirements.txt

# Run installation script for FaceFusion
RUN python3.10 install.py --onnxruntime cuda --skip-conda

# Expose the default ComfyUI port
EXPOSE 7860

# Start Scripts
COPY post_start.sh /post_start.sh

RUN chmod +x /post_start.sh

SHELL [ "/bin/bash", "-c" ]
CMD [ "/post_start.sh" ]









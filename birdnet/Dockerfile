
# Build from Python 3.8 slim
FROM python:3.8-slim

# Install required packages while keeping the image small
RUN apt-get update && apt-get install -y --no-install-recommends ffmpeg git  && rm -rf /var/lib/apt/lists/*

# Install required Python packages
RUN pip3 install numpy scipy librosa 

# Install Tensforflow
RUN pip3 install tensorflow 

# Install Bottle
RUN pip3 install bottle 

# Install and build app
RUN git clone https://github.com/kahst/BirdNET-Analyzer.git app

RUN cd app \
  && git checkout --quiet b5359d4

WORKDIR /app

# Add entry point to run the script
ENTRYPOINT [ "python3", "./server.py" ]
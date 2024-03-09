FROM python:3.9.2-slim-buster
WORKDIR /app
COPY requirements.txt .
RUN apt-get update \
  && apt-get install -y libgl1 libglib2.0-0 libsm6 libxrender1 libxext6 wget xz-utils \
  && wget https://github.com/BtbN/FFmpeg-Builds/releases/download/latest/ffmpeg-n5.1-latest-linux64-gpl-5.1.tar.xz \
  && tar -xvf ffmpeg-n5.1-latest-linux64-gpl-5.1.tar.xz -C /usr/bin/ --strip-components=1 \
  && rm ffmpeg-n5.1-latest-linux64-gpl-5.1.tar.xz

COPY . .
CMD ["python", "bash.py"]

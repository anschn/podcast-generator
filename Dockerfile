FROM ubuntu:latest

RUN apt-get update && apt-get install -y --no-install-recommends \
    python3.10 \
    python3-pip \
    git \
    curl \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN python3.10 -m pip install --upgrade pip --no-cache-dir && \
    python3.10 -m pip install PyYAML --no-cache-dir

COPY feed.py /usr/bin/feed.py

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
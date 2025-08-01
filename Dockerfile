FROM ubuntu:latest

# Installiere nur die notwendigen Systempakete
RUN apt-get update && apt-get install -y --no-install-recommends \
    python3 \
    python3-venv \
    python3-pip \
    git \
    curl \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Erstelle und aktiviere ein virtuelles Environment
RUN python3 -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

# Upgrade pip und installiere PyYAML im virtuellen Environment
RUN pip install --upgrade pip --no-cache-dir && \
    pip install PyYAML --no-cache-dir

# Upgrade pip und installiere PyYAML
RUN python3 -m pip install --upgrade pip --no-cache-dir && \
    python3 -m pip install PyYAML --no-cache-dir

COPY feed.py /usr/bin/feed.py

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
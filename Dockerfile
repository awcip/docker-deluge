FROM linuxserver/deluge

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
    python3-pip; \
    python3 -m pip install --no-cache-dir --upgrade pip; \
    python3 -m pip install --no-cache-dir --upgrade virtualenv; \
    virtualenv autotorrent-env; \
    autotorrent-env/bin/pip install autotorrent;

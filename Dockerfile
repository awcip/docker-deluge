from linuxserver/deluge

RUN python3 -m pip install --no-cache-dir --upgrade pip; \
    python3 -m pip install --no-cache-dir --upgrade virtualenv; \
    virtualenv autotorrent-env; \
    autotorrent-env/bin/pip install autotorrent;

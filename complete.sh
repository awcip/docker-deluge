#!/bin/bash
# Rebuild database when torrent completes and check if we can add any old torrent

# Source the authentication config
source /config/deluge.conf

sleep 3 # let move finish

echo "Rebuild started at: $(date -u)" >> /config/complete.log
flock -s /autotorrent/autotorrent.lock /autotorrent-env/bin/autotorrent \
      --config /autotorrent/autotorrent.conf --client deluge --rebuild \
      >> /config/complete.log

for folder in ${folders[@]}; do
      echo "Adding from $folder" >> /config/complete.log
      flock -s /autotorrent/autotorrent.lock /autotorrent-env/bin/autotorrent \
            --config /autotorrent/$autotorrent.conf --client $user -d -a /autotorrent/$folder/*.torrent \
            >> /config/complete.log
done

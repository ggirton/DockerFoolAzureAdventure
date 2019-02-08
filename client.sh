docker run alpine \
      /bin/sh -c "while :; do wget -qO- host.docker.internal:8000/randomg; printf '\n'; sleep 5; done"

#!/bin/bash

docker run -it \
  -p 9443:9443 \
  -v ~/.ssh/:/tmp/sshkeys/ \
  mkieboom/mapr-installer

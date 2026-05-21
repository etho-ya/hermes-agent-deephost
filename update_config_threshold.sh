#!/bin/bash
docker run --rm -u root -v ~/.hermes:/data mikefarah/yq -i '
  .compression.threshold = 0.13
' /data/config.yaml

cd ~/hermes-agent-deephost
docker compose restart hermes

#!/bin/bash
docker run --rm -u root -v ~/.hermes:/data mikefarah/yq -i '
  .auxiliary.compression.provider = "deepseek" |
  .auxiliary.compression.model = "deepseek-v4-pro" |
  .auxiliary.compression.base_url = "" |
  .auxiliary.compression.api_key = "" |
  .compression.threshold = 0.7
' /data/config.yaml

cd ~/hermes-agent-deephost
docker compose restart hermes

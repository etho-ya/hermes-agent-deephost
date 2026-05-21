#!/bin/bash
docker run --rm -u root -v ~/.hermes:/data mikefarah/yq -i '
  .auxiliary.vision.provider = "openrouter" |
  .auxiliary.vision.model = "nvidia/nemotron-nano-12b-v2-vl:free" |
  .auxiliary.vision.base_url = "" |
  .auxiliary.vision.api_key = "YOUR_OPENROUTER_API_KEY"
' /data/config.yaml

cd ~/hermes-agent-deephost
docker compose restart hermes

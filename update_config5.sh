#!/bin/bash
docker run --rm -u root -v ~/.hermes:/data mikefarah/yq -i '
  .auxiliary.title_generation.provider = "openrouter" |
  .auxiliary.title_generation.model = "meta-llama/llama-3.2-3b-instruct:free" |
  .auxiliary.title_generation.api_key = "YOUR_OPENROUTER_API_KEY" |
  
  .auxiliary.compression.provider = "openrouter" |
  .auxiliary.compression.model = "meta-llama/llama-3.2-3b-instruct:free" |
  .auxiliary.compression.api_key = "YOUR_OPENROUTER_API_KEY"
' /data/config.yaml

cd ~/hermes-agent-deephost
docker compose restart hermes

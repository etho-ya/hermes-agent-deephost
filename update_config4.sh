#!/bin/bash
docker run --rm -u root -v ~/.hermes:/data mikefarah/yq -i '
  .auxiliary.title_generation.provider = "openrouter" |
  .auxiliary.title_generation.model = "google/gemini-2.5-flash" |
  .auxiliary.title_generation.api_key = "YOUR_OPENROUTER_API_KEY" |
  
  .auxiliary.compression.provider = "openrouter" |
  .auxiliary.compression.model = "google/gemini-2.5-flash" |
  .auxiliary.compression.api_key = "YOUR_OPENROUTER_API_KEY"
' /data/config.yaml

cd ~/hermes-agent-deephost
docker compose restart hermes

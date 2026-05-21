#!/bin/bash
docker run --rm -u root -v ~/.hermes:/data mikefarah/yq -i '
  .auxiliary.title_generation.provider = "openai" |
  .auxiliary.title_generation.model = "llama-3.1-8b-instant" |
  .auxiliary.title_generation.base_url = "https://api.groq.com/openai/v1" |
  .auxiliary.title_generation.api_key = "YOUR_GROQ_API_KEY" |
  
  .auxiliary.compression.provider = "openai" |
  .auxiliary.compression.model = "llama-3.1-8b-instant" |
  .auxiliary.compression.base_url = "https://api.groq.com/openai/v1" |
  .auxiliary.compression.api_key = "YOUR_GROQ_API_KEY"
' /data/config.yaml

cd ~/hermes-agent-deephost
docker compose restart hermes

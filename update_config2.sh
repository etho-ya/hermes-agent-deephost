#!/bin/bash
docker run --rm -u root -v ~/.hermes:/data mikefarah/yq -i '
  .auxiliary.vision.provider = "openai" |
  .auxiliary.vision.model = "llama-3.2-90b-vision-preview" |
  .auxiliary.vision.base_url = "https://api.groq.com/openai/v1" |
  .auxiliary.vision.api_key = "YOUR_GROQ_API_KEY"
' /data/config.yaml

cd ~/hermes-agent-deephost
docker compose restart hermes

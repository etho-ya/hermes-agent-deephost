#!/bin/bash
docker run --rm -u root -v ~/.hermes:/data mikefarah/yq -i '.auxiliary.vision.provider = "groq" | .auxiliary.vision.model = "llama-3.2-90b-vision-preview"' /data/config.yaml
cd ~/hermes-agent-deephost
docker compose restart hermes

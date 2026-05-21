#!/bin/bash
docker run --rm -u root -v ~/.hermes:/data mikefarah/yq -i '
  .streaming.enabled = true |
  .display.platforms.telegram.tool_progress = "off" |
  .display.platforms.telegram.cleanup_progress = true |
  .display.interim_assistant_messages = false |
  .display.tool_preview_length = 0
' /data/config.yaml

cd ~/hermes-agent-deephost
docker compose restart hermes

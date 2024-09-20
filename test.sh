#!/bin/bash

URL="http://localhost:8001/chat"

DATA='{
  "prompt": "What is a LLM"
}'

curl -X POST "$URL" \
     -H "Content-Type: application/json" \
     -d "$DATA"

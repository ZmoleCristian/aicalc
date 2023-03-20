#!/bin/bash
api=$(cat api.key)
read input
response=$(curl https://api.openai.com/v1/chat/completions \
      -H 'Content-Type: application/json' \
      -H "Authorization: Bearer "$api"" \
      -s \
      -d '{
  "model": "gpt-3.5-turbo",
  "messages": [
  {"role": "system", "content": "You are a glorified scientific pocket calculator that returns only mathematical results, no details no text no explanation "},
  {"role": "user", "content": "'"$input"'"}
  ]
}')
result=$(echo $response | jq -r '.choices[].message.content')  
echo $result
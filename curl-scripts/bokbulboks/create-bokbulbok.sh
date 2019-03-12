#!/bin/bash

curl "http://localhost:4741/bokbulboks" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "bokbulbok": {
      "description": "'"${DESC}"'"
    }
  }'

echo

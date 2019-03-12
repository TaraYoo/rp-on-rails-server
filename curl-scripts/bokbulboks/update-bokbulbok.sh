#!/bin/bash

curl "http://localhost:4741/bokbulboks/${ID}" \
  --include \
  --request PATCH \
  --header "Content-Type: application/json" \
  --data '{
    "bokbulbok": {
      "description": "'"${DESC}"'"
    }
  }'

echo

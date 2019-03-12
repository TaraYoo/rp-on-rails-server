#!/bin/bash

curl "http://localhost:4741/bokbulboks/${ID}" \
  --include \
  --request PATCH \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "bokbulbok": {
      "used": "'"${USED}"'"
    }
  }'

echo

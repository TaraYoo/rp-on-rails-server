#!/bin/bash

curl "http://localhost:4741/bokbulboks" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --data '{
    "bokbulbok": {
      "description": "'"${DESC}"'"
    }
  }'

echo

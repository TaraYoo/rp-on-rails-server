#!/bin/bash

curl "http://localhost:4741/locations" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --data '{
    "location": {
      "name": "'"${NAME}"'",
      "plot": "'"${PLOT}"'"
    }
  }'

echo

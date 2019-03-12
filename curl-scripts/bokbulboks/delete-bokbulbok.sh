#!/bin/bash

curl "http://localhost:4741/bokbulboks/${ID}" \
  --include \
  --request DELETE \
  --header "Content-Type: application/json" \

echo

#!/bin/bash

curl "http://localhost:4741/random" \
  --include \
  --request GET \
  --header "Authorization: Token token=${TOKEN}" \


echo

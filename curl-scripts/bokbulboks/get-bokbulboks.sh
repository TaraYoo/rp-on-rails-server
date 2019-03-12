#!/bin/bash

curl "http://localhost:4741/bokbulboks" \
  --include \
  --request GET \
  --header "Authorization: Token token=${TOKEN}" \


echo

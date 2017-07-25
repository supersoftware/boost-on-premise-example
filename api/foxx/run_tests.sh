#!/bin/bash
set -e

FOXX_DIR=${FOXX_DIR:''}
MOUNT_POINT=${MOUNT_POINT:''}
TARGET_ARANGO_ENDPOINT=${TARGET_ARANGO_ENDPOINT:''}

# deploy foxx service
FOXX_URL="http://$TARGET_ARANGO_ENDPOINT/_db/_system/_api/foxx/?mount=$MOUNT_POINT&development=false&setup=true&legacy=false"
zip -r app.zip $FOXX_DIR
curl -X POST --header 'Content-Type: multipart/form-data' -F 'source=@app.zip' $FOXX_URL

# test foxx service
TEST_URL="http://$TARGET_ARANGO_ENDPOINT/_db/_system/_api/foxx/tests?mount=$MOUNT_POINT&idiomatic=false"
# test response
res=`curl -X POST --header 'Content-Type: application/json' --header 'Accept: application/json' $TEST_URL`

# test failure counts
failure_cnt=$(echo $res| jq '.stats | .failures')

# show stats
echo $res | jq '.stats'

if [ "$failure_cnt" -ne "0" ]; then
  # test failed
  echo "Test failed."
  echo $res | jq '.failures[]'
  exit 1
else
  # all tests passed
  echo "Test passed."
  exit 0
fi
#!/bin/sh
# nginx forwards port 8333 to the S3-compatible service (s3rver), which answers S3 API calls.
curl -fsS --max-time 10 http://nginx:8333/ | grep -q 'ListAllMyBucketsResult'

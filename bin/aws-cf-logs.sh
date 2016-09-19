#!/usr/bin/env bash

aws s3 sync s3://shapeshed.com/cf-logs .
cat *.gz > combined.log.gz
find $PWD ! -name 'combined.log.gz' -type f -exec rm -f {} +
gzip -d combined.log.gz
sed -i '/^#/ d' combined.log

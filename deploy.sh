#!/usr/bin/env bash

set -eo pipefail

function check_variables() {
  if [[ -z "$DEST_BUCKET" ]]; then
    echo "\$DEST_BUCKET must be defined" 1>&2
    exit 1
  fi

  if [[ -z "$CLOUDFRONT_DISTRIBUTION_ID" ]]; then
    echo "\$CLOUDFRONT_DISTRIBUTION_ID must be defined" 1>&2
    exit 1
  fi

  if [[ -z "$AWS_PROFILE" ]]; then
    if [[ -z "$AWS_ACCESS_KEY_ID" ]]; then
      echo "\$AWS_ACCESS_KEY_ID must be defined" 1>&2
      exit 1
    fi

    if [[ -z "$AWS_SECRET_ACCESS_KEY" ]]; then
      echo "\$AWS_SECRET_ACCESS_KEY must be defined" 1>&2
      exit 1
    fi
  fi
}

function copy_files_to_s3() {
  SOURCE_DIR="$PWD/src"
  aws s3 sync --delete "$SOURCE_DIR" s3://"$DEST_BUCKET"/
}

function create_cloudfront_invalidation() {
  aws cloudfront create-invalidation --distribution-id "$CLOUDFRONT_DISTRIBUTION_ID" --paths "/*" --no-cli-pager
}

check_variables
copy_files_to_s3
create_cloudfront_invalidation

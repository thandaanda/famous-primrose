#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5e5a3efe1c109b00199d9ebd/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5e5a3efe1c109b00199d9ebd
curl -s -X POST https://api.stackbit.com/project/5e5a3efe1c109b00199d9ebd/webhook/build/ssgbuild > /dev/null
gatsby build
curl -s -X POST https://api.stackbit.com/project/5e5a3efe1c109b00199d9ebd/webhook/build/publish > /dev/null

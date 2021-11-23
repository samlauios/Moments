#!/bin/sh
# Call `source ./scripts/export_env.sh` to execute

# export the environment variables
export $(grep -v '^#' ./local.keys | sed 's/#.*//')

# GITHUB_USERNAME=
# GITHUB_API_TOKEN=
# MATCH_PASSWORD=
# APP_STORE_CONNECT_API_CONTENT=
# FIREBASE_TOKEN=

export MATCH_GIT_BASIC_AUTHORIZATION=$(echo -n $GITHUB_USERNAME:$GITHUB_API_TOKEN | base64)



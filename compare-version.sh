#!/bin/sh

RED='\033[0;31m'
GREEN='\033[0;32m'
NO_COLLOR='\033[0m'
CHECKMARK='\xE2\x9C\x94'
CROSS='\xE2\x9C\x95'
MASTER_VERSION=$(git show master:"./package.json" | grep '"version"' | awk -F '"' '{print $4}')
CURRENT_VERSION=$(grep '"version"' "./package.json" | sed -E 's/.*"version": "([^"]+)".*/\1/')


if [[ "$(printf '%s\n' "$MASTER_VERSION" "$CURRENT_VERSION" | sort -V | head -n1)" < "$CURRENT_VERSION" ]]; then
    echo "${GREEN}$CHECKMARK package.json version is correct."
    exit 1
  else
    echo "${RED}$CROSS package.json version is incorrect. Expected higher than $MASTER_VERSION."
fi

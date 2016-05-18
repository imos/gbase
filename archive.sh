#!/bin/bash

set -eu

cd output

if [ -f ../archive.zip ]; then
  rm ../archive.zip
fi

zip -r ../archive.zip third_party/ WORKSPACE --exclude \*\*/.DS_Store

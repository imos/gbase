#!/bin/bash

set -eu

cd output

if [ -f ../gbase.zip ]; then
  rm ../gbase.zip
fi

zip -r ../gbase.zip third_party/ WORKSPACE --exclude \*\*/.DS_Store --exclude test/*

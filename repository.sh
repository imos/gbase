#!/bin/bash

if [ -d repository ]; then
  rm -rf repository
fi

mkdir -p repository
pushd repository
git clone -b v2.1.2 'https://github.com/gflags/gflags' gflags
git clone -b v0.3.4 'https://github.com/google/glog' glog
git clone -b release-1.7.0 'https://github.com/google/googletest' gtest
git clone -b release-1.7.0 'https://github.com/google/googlemock' gmock

#!/bin/bash

set -eu

ROOT_DIRECTORY="$(pwd)"
CXX="${CXX:=g++}"

if [ -d generated ]; then
  rm -rf generated
fi
cp -a repository generated

replace() {
  sed -i.bak -e "s/${1//\//\\/}/${2//\//\\/}/g" "$3"
  rm "$3.bak"
}

generate_gflags() {
  pushd generated/gflags
  cmake .
  popd
  mkdir -p output/third_party/gflags
  cp generated/gflags/include/gflags/* output/third_party/gflags/
  cp generated/gflags/src/*.cc  generated/gflags/src/*.h \
     output/third_party/gflags/
  for file in output/third_party/gflags/*.h \
              output/third_party/gflags/*.cc; do
    replace '#[[:blank:]]*include[[:blank:]]*"\([^/]*\)"' \
            '#include "third_party/gflags/\1"' \
            "${file}"
    replace '#[[:blank:]]*include[[:blank:]]*<config.h>' \
            '#include "third_party/gflags/config.h"' \
            "${file}"
  done
}

generate_glog() {
  pushd generated/glog
  ./configure CXX="${ROOT_DIRECTORY}/fake_compiler.sh ${CXX}"
  popd
  mkdir -p output/third_party/glog/
  cp generated/glog/src/glog/*.h output/third_party/glog/
  cp -f generated/glog/src/*.cc  generated/glog/src/*.h \
     output/third_party/glog/
  cp -a generated/glog/src/base output/third_party/glog/base
  rm output/third_party/glog/*test*.cc
  for file in output/third_party/glog/*.h \
              output/third_party/glog/*.cc \
              output/third_party/glog/base/*.h; do
    replace '#[[:blank:]]*include[[:blank:]]*<gflags/\([^/]*\)>' \
            '#include "third_party/gflags/\1"' \
            "${file}"
    replace '#[[:blank:]]*include[[:blank:]]*"\([^/]*\)"' \
            '#include "third_party/glog/\1"' \
            "${file}"
    replace '#[[:blank:]]*include[[:blank:]]*"glog/\([^/]*\)"' \
            '#include "third_party/glog/\1"' \
            "${file}"
    replace '#[[:blank:]]*include[[:blank:]]*"base/\([^/]*\)"' \
            '#include "third_party/glog/base/\1"' \
            "${file}"
  done
  cp -f src/third_party/glog/config.h output/third_party/glog/config.h
}

generate_gtest() {
  pushd generated/gtest
  cmake .
  popd
  mkdir -p output/third_party/gtest/internal/
  cp generated/gtest/src/*.{cc,h} output/third_party/gtest/
  cp generated/gtest/include/gtest/*.h output/third_party/gtest/
  cp generated/gtest/include/gtest/internal/*.h \
     output/third_party/gtest/internal/
  for file in output/third_party/gtest/*.h \
              output/third_party/gtest/*.cc \
              output/third_party/gtest/internal/*.h; do
    replace '#[[:blank:]]*include[[:blank:]]*"gtest/\([^/]*\)"' \
            '#include "third_party/gtest/\1"' \
            "${file}"
    replace '#[[:blank:]]*include[[:blank:]]*"gtest/internal/\([^/]*\)"' \
            '#include "third_party/gtest/internal/\1"' \
            "${file}"
    replace '#[[:blank:]]*include[[:blank:]]*"src/\([^/]*\)"' \
            '#include "third_party/gtest/\1"' \
            "${file}"
  done
  replace '.*kPathSeparatorString.*' '' \
          'output/third_party/gtest/gtest-filepath.cc'
}

generate_gmock() {
  pushd generated/gmock
  cmake .
  popd
  mkdir -p output/third_party/gmock/internal/
  cp generated/gmock/src/*.cc output/third_party/gmock/
  cp generated/gmock/include/gmock/*.h output/third_party/gmock/
  cp generated/gmock/include/gmock/internal/*.h \
     output/third_party/gmock/internal/
  for file in output/third_party/gmock/*.h \
              output/third_party/gmock/*.cc \
              output/third_party/gmock/internal/*.h; do
    replace '#[[:blank:]]*include[[:blank:]]*"gmock/\([^/]*\)"' \
            '#include "third_party/gmock/\1"' \
            "${file}"
    replace '#[[:blank:]]*include[[:blank:]]*"gmock/internal/\([^/]*\)"' \
            '#include "third_party/gmock/internal/\1"' \
            "${file}"
    replace '#[[:blank:]]*include[[:blank:]]*"src/\([^/]*\)"' \
            '#include "third_party/gmock/\1"' \
            "${file}"
    replace '#[[:blank:]]*include[[:blank:]]*"gtest/\([^"]*\)"' \
            '#include "third_party/gtest/\1"' \
            "${file}"
  done
}

generate_base() {
  # Remove to override with glog.
  rm generated/lmctfy/base/logging.*
  # Remove files not supported by Mac OSX.
  rm generated/lmctfy/base/sysinfo.*
  rm generated/lmctfy/base/walltime.*
  # Duplicated functions exist.
  rm generated/lmctfy/strings/strutil.*

  cp generated/lmctfy/base/*.{cc,h} output/base/
  cp generated/lmctfy/strings/*.{cc,h} output/strings/
  cp generated/lmctfy/util/gtl/*.h output/util/gtl/
  cp generated/lmctfy/util/utf/*.{cc,h} output/util/utf/
}

generate_map_util() {
  cp generated/protobuf/src/google/protobuf/stubs/map_util.h \
     output/util/gtl/
  local file='output/util/gtl/map_util.h'
  replace 'namespace google {' '' "${file}"
  replace 'namespace protobuf {' '' "${file}"
  replace '}  // namespace google' '' "${file}"
  replace '}  // namespace protobuf' '' "${file}"
  replace '#include <google/protobuf/stubs/common.h>' \
          '#include "third_party/glog/logging.h"' "${file}"
}

if [ -d output ]; then
  rm -rf output
fi
cp -a src output
generate_gflags
generate_glog
generate_gtest
generate_gmock
generate_base
generate_map_util

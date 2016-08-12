#ifndef BASE_BASE_H_
#define BASE_BASE_H_

#include "base/integral_types.h"
#include "base/macros.h"
#include "base/stringprintf.h"
#include "base/strtoint.h"
#include "base/thread_annotations.h"
#include "strings/join.h"
#include "strings/split.h"
#include "strings/strcat.h"
#include "strings/strip.h"
#include "strings/substitute.h"
#include "strings/util.h"
#include "third_party/gflags/gflags.h"
#include "third_party/glog/logging.h"
#include "util/gtl/algorithm.h"
#include "util/gtl/map_util.h"
#include "util/gtl/stl_util.h"

void ParseCommandLineFlags(int* argc, char*** argv);

#endif   // BASE_BASE_H_

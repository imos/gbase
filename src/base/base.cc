#include "base/macros.h"
#include "third_party/gflags/gflags.h"
#include "third_party/glog/logging.h"

void ParseCommandLineFlags(int* argc, char*** argv) {
  google::ParseCommandLineFlags(argc, argv, true);
  google::InitGoogleLogging((*argv)[0]);
}

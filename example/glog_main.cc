#include <stdio.h>

#include "third_party/gflags/gflags.h"
#include "third_party/glog/logging.h"

DEFINE_string(message, "", "Message.");

int main(int argc, char **argv) {
  google::ParseCommandLineFlags(&argc, &argv, true);
  google::InitGoogleLogging(argv[0]);
  LOG(INFO) << FLAGS_message;
  puts(FLAGS_message.c_str());

  return 0;
}

#include "base/base.h"
#include "base/testing.h"

void InitTest(int* argc, char*** argv) {
  testing::InitGoogleMock(argc, *argv);
  ParseCommandLineFlags(argc, argv);
}

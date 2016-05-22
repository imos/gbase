#include "base/testing.h"

#include <iostream>

GTEST_API_ int main(int argc, char** argv) {
  std::cout << "Running main() from testing_main.cc\n";
  InitTest(&argc, &argv);
  return RUN_ALL_TESTS();
}

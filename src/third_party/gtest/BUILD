licenses(["notice"])

package(default_visibility = ["//visibility:private"])

cc_library(
    name = "gtest",
    srcs = glob(["*.cc"], exclude = ["gtest_main.cc", "gtest-all.cc"]),
    hdrs = glob(["*.h", "internal/*.h"]),
    visibility = ["//visibility:public"],
)

cc_library(
    name = "gtest_main",
    srcs = ["gtest_main.cc"],
    hdrs = glob(["*.h", "internal/*.h"]),
    visibility = ["//visibility:public"],
    deps = [":gtest"],
    alwayslink = 1,
)

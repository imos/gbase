licenses(["notice"])

package(default_visibility = ["//visibility:private"])

cc_library(
    name = "gmock",
    srcs = glob(["*.cc"], exclude = ["gmock_main.cc", "gmock-all.cc"]),
    hdrs = glob(["*.h", "internal/*.h"]),
    deps = ["//third_party/gtest"],
    visibility = ["//visibility:public"],
)

cc_library(
    name = "gmock_main",
    srcs = ["gmock_main.cc"],
    hdrs = glob(["*.h", "internal/*.h"]),
    visibility = ["//visibility:public"],
    deps = [":gmock"],
    alwayslink = 1,
)

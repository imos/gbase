licenses(["notice"])

package(default_visibility = ["//visibility:private"])

cc_library(
    name = "glog",
    srcs = glob(["*.cc"]),
    hdrs = glob(["*.h", "base/*.h"]),
    visibility = ["//visibility:public"],
    deps = ["//third_party/gflags"],
    alwayslink = 1,
)

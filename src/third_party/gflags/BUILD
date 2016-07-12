licenses(["notice"])

package(default_visibility = ["//visibility:private"])

cc_library(
    name = "gflags",
    srcs = glob(["*.cc"], exclude = ["windows_*.cc"]),
    hdrs = glob(["*.h"], exclude = ["windows_*.h"]),
    visibility = ["//visibility:public"],
    linkopts = ["-pthread"],
    alwayslink = 1,
)

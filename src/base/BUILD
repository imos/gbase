licenses(["notice"])

package(default_visibility = ["//visibility:private"])

cc_library(
    name = "base",
    srcs = ["base.cc"],
    hdrs = ["base.h"],
    visibility = ["//visibility:public"],
    deps = [
        ":base_internal",
        "//strings",
        "//util/gtl",
    ]
)

cc_library(
    name = "base_internal",
    srcs = glob(["*.cc"], exclude =["base.cc", "testing.cc"]),
    hdrs = glob(["*.h"], exclude =["base.h", "testing.h"]),
    visibility = [
        "//strings:__subpackages__",
        "//util:__subpackages__",
    ],
    deps = [
        "//third_party/glog",
        "//third_party/gflags",
    ],
)

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
    ],
)

cc_library(
    name = "testing",
    srcs = ["testing.cc"],
    hdrs = ["testing.h"],
    testonly = 1,
    visibility = ["//visibility:public"],
    deps = [
        ":base",
        "//third_party/gmock",
    ],
)

cc_library(
    name = "testing_main",
    srcs = ["testing_main.cc"],
    testonly = 1,
    visibility = ["//visibility:public"],
    deps = [":testing"],
    alwayslink = 1,
)

cc_library(
    name = "base_internal",
    srcs = glob(
        ["*.cc"],
        exclude =["base.cc", "testing.cc", "testing_main.cc"]),
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

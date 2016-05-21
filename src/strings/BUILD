licenses(["notice"])

package(default_visibility = ["//visibility:private"])

cc_library(
    name = "strings",
    srcs = glob(["*.cc"]),
    hdrs = glob(["*.h"]),
    visibility = [
        "//base:__subpackages__",
    ],
    deps = [
        "//base:base_internal",
        "//util/gtl",
        "//util/utf",
    ],
    # Disable warnings because this is a common library.
    copts = [
        "-Wno-c++11-narrowing",
        "-w",
    ],
)

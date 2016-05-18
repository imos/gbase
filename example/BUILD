licenses(["notice"])

package(default_visibility = ["//visibility:private"])

cc_binary(
    name = "glog_main",
    srcs = ["glog_main.cc"],
    deps = [
        "//external:glog",
        "//external:gflags",
    ],
)

cc_test(
    name = "gmock_test",
    srcs = ["gmock_test.cc"],
    deps = [
        "//external:gmock_main",
    ],
)

cc_test(
    name = "gtest_test",
    srcs = ["gtest_test.cc"],
    deps = [
        "//external:gtest_main",
    ],
)

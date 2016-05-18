licenses(["notice"])

package(default_visibility = ["//visibility:private"])

cc_binary(
    name = "glog_main",
    srcs = ["glog_main.cc"],
    deps = [
        "//third_party/glog",
        "//third_party/gflags",
    ],
)

cc_test(
    name = "gmock_test",
    srcs = ["gmock_test.cc"],
    deps = [
        "//third_party/gmock:gmock_main",
    ],
)

cc_test(
    name = "gtest_test",
    srcs = ["gtest_test.cc"],
    deps = [
        "//third_party/gtest:gtest_main",
    ],
)

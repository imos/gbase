licenses(["notice"])

package(default_visibility = ["//visibility:private"])

cc_binary(
    name = "glog_main",
    srcs = ["glog_main.cc"],
    deps = [
        "//external:base",
    ],
)

cc_test(
    name = "gtest_test",
    srcs = ["gtest_test.cc"],
    deps = [
        "//external:testing_main",
    ],
)

cc_test(
    name = "strings_test",
    srcs = ["strings_test.cc"],
    deps = [
        "//external:testing_main",
    ],
)

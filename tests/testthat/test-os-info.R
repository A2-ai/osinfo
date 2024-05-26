test_that("os_info runs", {
  sys_info <- Sys.info()
  osinfo <- os_info()

  expect_equal(osinfo$architecture, sys_info[["machine"]])
  # https://docs.rs/os_info/latest/os_info/enum.Type.html
  if (sys_info[["sysname"]] == "Darwin") {
    expect_true(osinfo$os_type == "Mac OS")
    expect_true(osinfo$os == "macos")
  }
  if (sys_info[["sysname"]] == "linux") {
    # this might not hold, but at least on our aws AMI see
    # a version of "#18~22.04.1-Ubuntu SMP Wed Jan 10 22:54:16 UTC 2024"
    # so the fact that osinfo$os_type is Ubuntu should match
    expect_true(grepl(x = sys_info$version, osinfo$os_type, fixed = TRUE))
    expect_true(osinfo$os == "linux")
  }
})

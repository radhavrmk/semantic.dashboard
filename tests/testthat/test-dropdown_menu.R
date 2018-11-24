context("dropdown_menu")

test_that("test notification_item inputs", {
  si_str <- as.character(
    notification_item("abc")
  )
  expect_true(any(grepl("<div class=\"item\">",
                        si_str, fixed = TRUE)))
  expect_true(any(grepl("<div class=\"ui label \">",
                        si_str, fixed = TRUE)))
  expect_true(any(grepl("<i class=\"small warning icon\"></i>",
                        si_str, fixed = TRUE)))
  expect_true(any(grepl("abc",
                        si_str, fixed = TRUE)))
})

test_that("test task_item inputs", {
  si_str <- as.character(
    task_item("Project progress...", 50.777, color = "red")
  )
  expect_true(any(grepl("data-percent=\"50.777\"",
                        si_str, fixed = TRUE)))
  expect_true(any(grepl("<div class=\"label\">Project progress...</div>",
                        si_str, fixed = TRUE)))
  expect_true(any(grepl("ui active progress red",
                        si_str, fixed = TRUE)))
  # are function names returning the same?
  expect_equal(task_item("P", 50.777, color = "red"),
               taskItem("P", 50.777, color = "red"))
})

test_that("test message_item inputs", {
  si_str <- as.character(
    message_item("message", "abc", icon = "warning")
  )
  expect_true(any(grepl("<span class=\"description\">abc</span>",
                        si_str, fixed = TRUE)))
  expect_true(any(grepl("<i class=\"warning icon\"></i>",
                        si_str, fixed = TRUE)))
  expect_true(any(grepl("message",
                        si_str, fixed = TRUE)))
  # are function names returning the same?
  expect_equal(message_item("qw", "abc"), messageItem("qw", "abc"))
})

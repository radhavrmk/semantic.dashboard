context("tab")

test_that("test tab_item input", {
  expect_error(tab_item())
  si_str <- as.character(tab_item("Q"))
  expect_true(any(grepl("data-tab=\"shiny-tab-Q\"",
                        si_str, fixed = TRUE)))
  expect_true(any(grepl("<div class=\"ui padded grid\"></div>",
                        si_str, fixed = TRUE)))
  si_str <- as.character(tab_item("Q", shiny::p("a")))
  expect_true(any(grepl("<p>a</p>",
                        si_str, fixed = TRUE)))
})

test_that("test tab_items input", {
  si_str <- as.character(
    tab_items(tabItem(tabName = "tab1", "Tab 1"),
              tabItem(tabName = "tab2", "Tab 2"))
  )
  expect_true(any(grepl("data-tab=\"shiny-tab-tab1\"",
                        si_str, fixed = TRUE)))
  expect_true(any(grepl("<div class=\"ui padded grid\">Tab 2</div>",
                        si_str, fixed = TRUE)))
})

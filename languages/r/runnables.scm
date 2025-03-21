; runnables.scm

; test_that functions
(
  (call
    function: (identifier) @fn (#eq? @fn "test_that")
    arguments: (arguments
                 (argument
                   value: (string
                           (string_content) @desc)
                 )
                 (_)*
    )
  ) @run
  (#set! tag r-test)
)

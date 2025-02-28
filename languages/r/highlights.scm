; highlights.scm


; Literals

[
  (integer)
  (float)
  (complex)
] @number

(string) @string
(string (escape_sequence) @string.escape)

(comment) @comment

(identifier) @variable

(formal_parameters (identifier) @parameter)
(formal_parameters (default_parameter (identifier) @parameter))

; Operators
[
 "="
 "<-"
 "<<-"
 "->>"
 "->"
] @operator

(unary operator: [
  "-"
  "+"
  "!"
  "~"
] @operator)

(binary operator: [
  "-"
  "+"
  "*"
  "/"
  "^"
  "<"
  ">"
  "<="
  ">="
  "=="
  "!="
  "||"
  "|"
  "&&"
  "&"
  ":"
  "~"
] @operator)

[
  "|>"
  (special)
] @operator

(lambda_function "\\" @operator)

[
 "("
 ")"
 "["
 "]"
 "{"
 "}"
] @punctuation.bracket

(dollar "$" @operator)
(slot "@" @operator)

(subset2
 [
  "[["
  "]]"
 ] @punctuation.bracket)

[
 "in"
 (dots)
 (break)
 (next)
 (inf)
] @keyword

[
  (nan)
  (na)
  (null)
] @type.builtin

[
  "if"
  "else"
  "switch"
] @keyword

[
  "while"
  "repeat"
  "for"
] @keyword

[
  (true)
  (false)
] @boolean

; funcs
; "function" @keyword.function
(call function: (identifier) @function)

(call function: (identifier) @keyword
  (#any-of? @keyword "library" "require" "source" "return" "stop" "try" "tryCatch"))

[
  (function_definition)
  (lambda_function)
] @function.outer

(function_definition "function" @keyword)

(lambda_function "\\" @keyword)

(default_argument name: (identifier) @parameter)

; namespace calls
(namespace_get function: (identifier) @function)
(namespace_get_internal function: (identifier) @function)

(namespace_get
    namespace: (identifier) @name
    "::" @operator)
(namespace_get_internal
    namespace: (identifier) @name
    ":::" @operator)

; Error
(ERROR) @error

; roxygen
((comment) @documentation
    (#match? @documentation "^#'"))

; jupyter cell tag
((comment) @operator
    (#match? @operator "^#\\s?%%"))

; highlights.scm


; Literals

(integer) @number

(float) @float

(complex) @number

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
] @conditional

[
  "while"
  "repeat"
  "for"
] @repeat

[
  (true)
  (false)
] @boolean

; funcs
"function" @keyword.function
(call function: (identifier) @function)

[
  (function_definition)
  (lambda_function)
] @function.outer

(function_definition
  [
    (call)
    (binary)
    (brace_list)
  ] @function.inner) @function.outer

(lambda_function
  [
    (call)
    (binary)
    (brace_list)
  ] @function.inner
) @function.outer

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

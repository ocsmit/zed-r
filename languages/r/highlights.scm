; highlights.scm

; Literals

(integer) @number
(float) @number
(complex) @number

(string) @string
(string (string_content (escape_sequence) @string.escape))

; Comments

(comment) @comment

; Operators

[
  "?" ":=" "=" "<-" "<<-" "->" "->>"
  "~" "|>" "||" "|" "&&" "&"
  "<" "<=" ">" ">=" "==" "!="
  "+" "-" "*" "/" "::" ":::"
  "**" "^" "$" "@" ":" "!"
  "special"
] @operator

; Punctuation

[
  "("  ")"
  "{"  "}"
  "["  "]"
  "[[" "]]"
] @punctuation.bracket

(comma) @punctuation.delimiter

; Variables

(identifier) @variable

; Functions

(binary_operator
    lhs: (identifier) @function
    operator: "<-"
    rhs: (function_definition)
)

(binary_operator
    lhs: (identifier) @function
    operator: "="
    rhs: (function_definition)
)

; Calls

(call function: (identifier) @function)

; Parameters

(parameters (parameter name: (identifier) @variable.parameter))
(arguments (argument name: (identifier) @variable.parameter))

; Namespace

(namespace_operator lhs: (identifier) @type)

(call
    function: (namespace_operator rhs: (identifier) @function)
)(call function: (identifier) @function)


; Keywords

(function_definition name: "function" @keyword.function)
(function_definition name: "\\" @keyword.function)

[
  "in"
  (return)
  (next)
  (break)
   "if"
   "else"
   ; "switch"
   "while"
   "repeat"
   "for"
] @keyword

; [
;   "if"
;   "else"
; ] @conditional

; [
;   "while"
;   "repeat"
;   "for"
; ] @repeat

[
  (true)
  (false)
] @boolean

[
  (null)
  (inf)
  (nan)
  (na)
  (dots)
  (dot_dot_i)
] @constant.builtin

; Error

(ERROR) @error

(call function: (identifier) @keyword
  (#any-of? @keyword "library" "require" "source" "return" "stop" "try" "tryCatch"))

; roxygen
((comment) @documentation
    (#match? @documentation "^#'"))

; jupyter cell tag
((comment) @operator
    (#match? @operator "^#\\s?%%"))

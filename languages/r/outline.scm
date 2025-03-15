; Variables by assignment operators
(binary_operator
    lhs: (identifier) @name
    operator: ["<-" "=" "<<-"]
    rhs: (_)
) @item

(binary_operator
    lhs: (_)
    operator: ["->" "->>"]
    rhs: (identifier) @name
) @item

; Variables by `for` loop
(for_statement
  "for" @context
  "(" @context
  variable: (identifier) @name
  "in" @context
  sequence: (_) @context
  ")" @context
) @item

; Jupyter cell tag
(
    (comment) @name
    (#match? @name "^#\\s?%%")
) @item

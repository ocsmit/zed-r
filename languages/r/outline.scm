; Variables
(left_assignment
   name: (identifier) @name
   value: (_) @value) @item

(equals_assignment
   name: (identifier) @name
   value: (_) @value) @item

; `for` statement
(for
  "(" (identifier) @name
      "in" (_) @value
  ")"
  body: (_)) @item

; Jupyter cell tag
(
  (comment) @name
  (#match? @name "^#\\s?%%")
) @item

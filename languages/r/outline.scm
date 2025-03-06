; Variables
(left_assignment
   name: (identifier) @name
   value: (_) @value) @item

(equals_assignment
   name: (identifier) @name
   value: (_) @value) @item

(right_assignment
    value: (_) @value
    name: (identifier) @name) @item

(super_assignment
    name: (identifier) @name
    value: (_) @value) @item

(super_right_assignment
    value: (_) @value
    name: (identifier) @name) @item

; `for` loop
(for
  "(" (identifier) @name
      "in" (_) @value
  ")"
  body: (_)) @item

; Jupyter cell tag
(
  (comment) @name
  (#match? @name "^#\\s%%")
) @item

; From nvim-treesitter/nvim-treesitter (adapted for R Markdown)

; ── Headings ────────────────────────────────────────────────────────────────
(atx_heading
  (inline) @text.title)

(setext_heading
  (paragraph) @text.title)

[
  (atx_h1_marker)
  (atx_h2_marker)
  (atx_h3_marker)
  (atx_h4_marker)
  (atx_h5_marker)
  (atx_h6_marker)
  (setext_h1_underline)
  (setext_h2_underline)
] @punctuation.special

; ── Front matter (YAML / TOML) ───────────────────────────────────────────────
; These are leaf nodes; the full block (including injected content) gets the
; @embedded scope so themes can colour/background it distinctly from prose.
(minus_metadata) @embedded
(plus_metadata) @embedded

; ── Fenced code blocks ───────────────────────────────────────────────────────
; The outer block gets @text.literal so themes can shade it.
[
  (link_title)
  (indented_code_block)
  (fenced_code_block)
] @text.literal

; Opening/closing fence delimiters  ─── ``` or ~~~
(fenced_code_block_delimiter) @punctuation.special

; Info string: the  {r chunk-name, echo=FALSE}  part.
; Styled as @attribute so accent-colour themes make it pop visually.
(fenced_code_block
  (info_string) @attribute)

; Suppress the text.literal foreground on the code body so that injected
; language highlights (R, Python, bash …) can paint their own colours.
(code_fence_content) @none

; ── Links ────────────────────────────────────────────────────────────────────
(link_destination) @link_uri

(link_label) @text.reference

; ── Lists ────────────────────────────────────────────────────────────────────
[
  (list_marker_plus)
  (list_marker_minus)
  (list_marker_star)
  (list_marker_dot)
  (list_marker_parenthesis)
  (thematic_break)
] @punctuation.list_marker

; ── Misc ─────────────────────────────────────────────────────────────────────
[
  (block_continuation)
  (block_quote_marker)
] @punctuation.special

(backslash_escape) @string.escape

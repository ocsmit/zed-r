; Inject R into ```{r ...} fenced code chunks
(fenced_code_block
    (info_string) @_lang
    (code_fence_content) @injection.content
    (#match? @_lang "(?i)^\\{r")
    (#set! injection.language "r"))

; Inject Python into ```{python ...} fenced code chunks
(fenced_code_block
    (info_string) @_lang
    (code_fence_content) @injection.content
    (#match? @_lang "(?i)^\\{python")
    (#set! injection.language "python"))

; Inject Bash into ```{bash ...} fenced code chunks
(fenced_code_block
    (info_string) @_lang
    (code_fence_content) @injection.content
    (#match? @_lang "(?i)^\\{bash")
    (#set! injection.language "bash"))

; Inject YAML for front matter delimited by ---
; minus_metadata is a leaf node — inject the whole node
(minus_metadata) @injection.content
(#set! injection.language "YAML")

; Inject TOML for front matter delimited by +++
; plus_metadata is a leaf node — inject the whole node
(plus_metadata) @injection.content
(#set! injection.language "TOML")

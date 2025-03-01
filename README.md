# zed-r

Provides [tree-sitter](https://tree-sitter.github.io/tree-sitter/) queries and [Language Server Protocol (LSP)](https://github.com/REditorSupport/languageserver?tab=readme-ov-file) support for Zed.

# Installing

The latest version can be installed from the Zed extensions menu, or by cloning the repo and installing it locally from the Zed extensions menu.

# LSP

The R packages 'languageserver' and 'lintr' are needed

# RStudio keybindings

  - Add this to your keybindings.json by opening the command palette (Ctrl+Shift+P) and selecting `zed: open keybindings`

```
  {
    "context": "Editor",
    "bindings": {
      "ctrl-shift-m": ["workspace::SendKeystrokes", "|>"],
      "alt--": ["workspace::SendKeystrokes", "< -"],
      "ctrl-alt-i": ["workspace::SendKeystrokes", "\n# %%\n"]
      }
  }
```

# Enabling R Tests

  - Add this to your tasks.json by opening the command palette (Ctrl+Shift+P) and selecting `zed: open tasks`

```
[
  {
    "label": "Run all R tests",
    "command": "Rscript -e \"testthat::test_dir('tests/testthat')\"",
    "cwd": "$ZED_WORKTREE_ROOT",
    "use_new_terminal": false,
    "allow_concurrent_runs": false,
    "reveal": "always",
    "show_summary": true,
    "show_output": true
  },
  {
    "label": "Run current R file test",
    "command": "Rscript -e \"testthat::test_file('$ZED_RELATIVE_FILE')\"",
    "cwd": "$ZED_WORKTREE_ROOT",
    "use_new_terminal": false,
    "allow_concurrent_runs": false,
    "reveal": "always",
    "show_summary": true,
    "show_output": true
  }
]
```

  - For a keyboard shortcut for tests, follow [this section](https://zed.dev/docs/tasks#custom-keybindings-for-tasks) in the official Zed documentation.

# Caveats
  - A custom startup message in `.Rprofile` can potentially cause the the LSP message headers to be decoded improperly and prevent the language server from starting in Zed ([#7](https://github.com/ocsmit/zed-r/issues/7)).


# Known issues

Check out the project's [issue list](https://github.com/ocsmit/zed-r/issues) for a list of unresolved issues. Feel free to fix any of them and send me a pull request!

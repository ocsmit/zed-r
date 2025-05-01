# zed-r

Provides [tree-sitter](https://tree-sitter.github.io/tree-sitter/) queries and [Language Server Protocol (LSP)](https://github.com/REditorSupport/languageserver?tab=readme-ov-file) support for Zed.

# Installing

The latest version can be installed from the Zed extensions menu, or by cloning the repo and installing it locally from the Zed extensions menu.

Additionally, it is recommended to run R code using Zed's REPL feature. To enable this, install either the Ark or Xeus Jupyter kernels; then in an R file create a REPL cell by typing `# %%` (or by using the shortcut available [below](https://github.com/ocsmit/zed-r/#rstudio-keybindings)) and run it by pressing `ctrl-shift-enter`.

Further information can be found at:
  - https://zed.dev/docs/languages/r
  - https://zed.dev/docs/repl

# LSP

The R packages `languageserver` and `lintr` are needed.

# RStudio keybindings

  - Add this to your keymap.json by opening the command palette (Ctrl+Shift+P) and selecting `zed: open keymap`.

  **Note: macOS users will likely want to replace `ctrl` with `cmd`.**

```json
  {
    "context": "Editor",
    "bindings": {
      "ctrl-shift-f10": "repl::Restart", // Equivalent to restarting R in RStudio
      "ctrl-\\": "assistant::InlineAssist",
      "ctrl-shift-m": ["workspace::SendKeystrokes", "space |> space"],
      "alt--": ["workspace::SendKeystrokes", "space < - space"],
      "ctrl-alt-i": ["workspace::SendKeystrokes", "\n# space %%\n"],
      "ctrl-shift-d": [
        "task::Spawn",
        { "task_name": "Document local R package", "reveal_target": "center" }
      ],
      "ctrl-alt-enter": [
        "workspace::SendKeystrokes",
        "ctrl-c ctrl-` ctrl-shift-v enter ctrl-`"
      ]
    }
  },
  {
    "context": "Workspace",
    "bindings": {
      "ctrl-shift-t": [
        "task::Spawn",
        { "task_name": "Run all R tests", "reveal_target": "center" }
      ],
      "ctrl-shift-r": [
        "task::Spawn",
        { "task_name": "Run current R file test", "reveal_target": "center" }
      ],
      "ctrl-shift-b": [
        "task::Spawn",
        { "task_name": "Install local R package", "reveal_target": "center" }
      ],
      "ctrl-2": [
        "task::Spawn",
        { "task_name": "R Terminal", "reveal_target": "dock" }
      ],
      "ctrl-shift-s": [
        "task::Spawn",
        { "task_name": "Source current file", "reveal_target": "center"}
      ],
      "ctrl-shift-e": [
        "task::Spawn",
        { "task_name": "Check local R package", "reveal_target": "center"}
      ]
    }
  }
```

# Tasks for R (works with RStudio keybindings)

  - Add this to your tasks.json by opening the command palette (Ctrl+Shift+P) and selecting `zed: open tasks`

```json
[
  {
    "label": "R Terminal",
    "command": "R",
    "cwd": "$ZED_WORKTREE_ROOT",
    "use_new_terminal": true
  },
  {
    "label": "Install local R package",
    "command": "R CMD INSTALL .",
    "cwd": "$ZED_WORKTREE_ROOT",
    "use_new_terminal": false,
    "allow_concurrent_runs": false,
    "reveal": "always",
    "show_summary": true,
    "show_output": true,
    "show_error": true
  },
  {
    "label": "Document local R package",
    "command": "Rscript -e \"devtools::document(roclets = c('rd', 'collate', 'namespace'))\"",
    "cwd": "$ZED_WORKTREE_ROOT",
    "use_new_terminal": false,
    "allow_concurrent_runs": false
  },
  {
    "label": "Check local R package",
    "command": "Rscript -e \"devtools::check()\"",
    "cwd": "$ZED_WORKTREE_ROOT",
    "use_new_terminal": false,
    "allow_concurrent_runs": false
  },
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
  },
  {
    "label": "Run test_that test", // Can be triggered, without a keyboard shortcut
    // or clicking on the run button, by toggling the code action menu (Ctrl+.)
    "command": "Rscript",
    "cwd": "$ZED_WORKTREE_ROOT",
    "args": [
      "-e",
      "\"testthat::test_file(\\\"${ZED_FILE}\\\", desc = \\\"${ZED_CUSTOM_desc}\\\")\""
    ],
    "tags": ["r-test"]
  },
  {
    "label": "Source current file",
    "command": "Rscript -e \"source('$ZED_RELATIVE_FILE', echo = TRUE)\"",
    "cwd": "$ZED_WORKTREE_ROOT",
    "use_new_terminal": false,
    "allow_concurrent_runs": false,
    "reveal": "always",
    "show_summary": true,
    "show_output": true
  }
]
```

  - For a different keyboard shortcut for tasks, read [this section](https://zed.dev/docs/tasks#custom-keybindings-for-tasks) in the official Zed documentation.

# Caveats
  - A custom startup message in `.Rprofile` can potentially cause the the LSP message headers to be decoded improperly and prevent the language server from starting in Zed ([#7](https://github.com/ocsmit/zed-r/issues/7)).


# Known issues

Check out the project's [issue list](https://github.com/ocsmit/zed-r/issues) for a list of unresolved issues. Feel free to fix any of them and send us a pull request!

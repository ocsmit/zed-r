# zed-r

Provides [tree-sitter](https://tree-sitter.github.io/tree-sitter/) queries and [Language Server Protocol (LSP)](https://github.com/REditorSupport/languageserver?tab=readme-ov-file) support for Zed.

# Installing

The latest version can be installed from the Zed extensions menu, or by cloning the repo and installing it locally from the Zed extensions menu.

# LSP

The R packages 'languageserver' and 'lintr' are needed

# Caveats
  - A custom startup message in `.Rprofile` can potentially cause the the LSP message headers to be decoded improperly and prevent the language server from starting in Zed ([#7](https://github.com/ocsmit/zed-r/issues/7)). 


# Known issues

Check out the project's [issue list](https://github.com/ocsmit/zed-r/issues) for a list of unresolved issues. Feel free to fix any of them and send me a pull request! 


# Neovim configuration

`~/.config/nvim` is a symlink to `config/nvim` in this repo. Plugins are
managed with [lazy.nvim](https://github.com/folke/lazy.nvim); specs live in
`lua/plugins/`.

## Language servers

All are enabled with zero per-project configuration. Format-on-save is handled
by the servers themselves — there is no formatting plugin and no `formatprg`
fallback.

| filetype | server | package |
| --- | --- | --- |
| `lua` | `lua_ls` | `lua-language-server` |
| `rust` | `rust_analyzer` | rustup component |
| `go` | `gopls` | `go install` |
| `sh` | `bashls` | `bash-language-server` |
| `ts`, `js` | `ts_ls` | `typescript-language-server` |
| `js`, `ts` | `eslint` | `eslint` (AUR) |
| `yaml` | `yamlls` | `yaml-language-server` |
| `json` | `jsonls` | `vscode-json-languageserver` |
| `html` | `html` | `vscode-html-languageserver` |
| `css` | `cssls` | `vscode-css-languageserver` |
| `markdown` | `panache` | `panache-bin` (AUR) |
| `toml` | `tombi` | `tombi` |
| `solidity` | `solidity_ls` | `foundry-bin` (AUR), runs `forge lsp` |

`solidity_ls` runs the Solar language server embedded in Foundry, configured as:

```lua
vim.lsp.config("solidity_ls", {
  capabilities = capabilities,
  cmd = { "forge", "lsp" },
  root_markers = { "foundry.toml", ".git" },
})
```

It reads `foundry.toml` itself, including the `[fmt]` section, and delegates
formatting to `forge fmt`.

## Format on save

`lua/plugins/lsp-config.lua` registers one `LspAttach` autocmd, following
`:help lsp-lint`. For each client that attaches:

- `textDocument/willSaveWaitUntil` — the server formats as part of the save
  and needs no autocmd. None of the servers here implement it.
- `textDocument/formatting` — a buffer-local `BufWritePre` autocmd is
  registered that calls
  `vim.lsp.buf.format({ bufnr = ev.buf, id = client.id, timeout_ms = 1000 })`.

Scoping by `id` means each buffer is formatted by the client serving it, and
filetypes with no formatting server are left alone. `gq` uses the same server,
since Neovim sets `formatexpr` to `vim.lsp.formatexpr()` on `LspAttach`.

`lua/config/autocmd.lua` separately trims trailing whitespace and trailing
blank lines on save. That runs no formatter.

### Verified

Each filetype below was opened, given time for its server to attach, written,
and compared against an unmodified copy.

| filetype | server | result |
| --- | --- | --- |
| `lua` | `lua_ls` | formatted |
| `rust` | `rust_analyzer` | formatted |
| `go` | `gopls` | formatted |
| `sh` | `bashls` | formatted |
| `ts` | `ts_ls` | formatted |
| `yaml` | `yamlls` | formatted |
| `json` | `jsonls` | formatted |
| `html` | `html` | formatted |
| `css` | `cssls` | formatted |
| `markdown` | `panache` | formatted |
| `toml` | `tombi` | formatted |
| `solidity` | `solidity_ls` | formatted |

`eslint` was not verified separately; it shares `javascript` and `typescript`
with `ts_ls`.

`rust_analyzer` needs roughly ten seconds to index a new workspace. A save
during that window is not formatted. Later saves are fine.

## Defaults

`lua/config/set.lua` sets `expandtab`, `shiftwidth = 4`, `tabstop = 4`,
`softtabstop = 4`. These apply to any file without a more specific setting.
Servers without project configuration of their own format using these, so the
editor and the formatter agree.

Go differs by design, since gofmt always emits tabs. Neovim's `'autoindent'`
copies existing leading whitespace verbatim, so pressing <CR> in a
tab-indented Go block inserts a tab. A new Go file typed from nothing uses
spaces until the first save reformats it.

## Project overrides

`.editorconfig` is read by `ts_ls`, `bashls` and `lua_ls` (via
[EmmyLuaCodeStyle](https://luals.github.io/wiki/formatter/)), and takes
precedence over `shiftwidth`. It is not read by gofmt or rustfmt:

| server | reads `.editorconfig` | own config |
| --- | --- | --- |
| `lua_ls` | yes | none |
| `ts_ls` | yes | `tsconfig.json` |
| `bashls` | yes | shfmt flags |
| `rust_analyzer` | no | `rustfmt.toml` |
| `gopls` | no | none |

Rust uses `rustfmt.toml`, where `tab_spaces` is a number and the boolean is
`hard_tabs`:

```toml
hard_tabs = false
tab_spaces = 4
```

To change the editor's indentation for one project, add a project-local
`after/ftplugin/lua.lua` containing `vim.opt.shiftwidth = ...`.

## Syntax highlighting

`lua/plugins/treesitter.lua` installs parsers for `c`, `css`, `go`, `gotmpl`,
`html`, `javascript`, `lua`, `rust`, `solidity` and `typescript`, and starts
highlighting per filetype. Parsers are only installed when missing.

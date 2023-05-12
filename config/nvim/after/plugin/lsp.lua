local lsp = require("lsp-zero").preset({})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({ buffer = bufnr })
end)

lsp.ensure_installed({
  "bashls",
  "cssls",
  "lua_ls",
  "html",
  "jsonls",
  "rust_analyzer",
  "tsserver",
  "gopls",
})

lsp.configure("lua_ls", {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
})

lsp.format_on_save({
  format_opts = {
    timeout_ms = 10000,
  },
  servers = {
    ["null-ls"] = {
      "javascript",
      "rust",
      "css",
      "html",
      "typescript",
      "sh",
      "lua",
      "markdown",
      "go",
    },
  },
})

lsp.format_mapping("gq", {
  format_opts = {
    async = false,
    timeout_ms = 10000,
  },
  servers = {
    ["null-ls"] = {
      "javascript",
      "rust",
      "html",
      "typescript",
      "sh",
      "lua",
      "markdown",
      "go",
    },
  },
})

lsp.setup()

local null_ls = require("null-ls")

local sources = {
  -- Replace these with the tools you have installed
  null_ls.builtins.formatting.shfmt.with({
    extra_args = { "-i", "2", "-ci" },
  }),
  null_ls.builtins.formatting.prettier,
  --null_ls.builtins.diagnostics.tidy,
  null_ls.builtins.diagnostics.stylelint,
  null_ls.builtins.diagnostics.markdownlint,
  null_ls.builtins.diagnostics.eslint,
  null_ls.builtins.formatting.rustfmt,
  null_ls.builtins.formatting.trim_newlines,
  null_ls.builtins.formatting.trim_whitespace,
  null_ls.builtins.formatting.stylua,
  null_ls.builtins.formatting.prettier.with({
    filetypes = { "html", "css", "yaml", "markdown", "json" },
  }),
}

null_ls.setup({ sources = sources })

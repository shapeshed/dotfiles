local M = {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    local lspconfig = require("lspconfig")
    -- Lua Language Server
    lspconfig.lua_ls.setup({
      capabilities = capabilities,
      on_attach = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = false
      end,
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
          editor = {
            formatOnSave = false,
          },
        },
      },
    })

    -- Rust Analyser
    lspconfig.rust_analyzer.setup({
      capabilities = capabilities,
      settings = {
        ["rust-analyzer"] = {
          rustfmt = {
            extraArgs = { "+nightly" },
          },
        },
      },
    })

    -- Bash Lanaguage Server
    lspconfig.bashls.setup({
      capabilities = capabilities,
    })
  end,
}

return M

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
      on_attach = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = true
      end,
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

    -- Typescript
    lspconfig.tsserver.setup({
      capabilities = capabilities,
      on_attach = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = false
      end,
    })

    lspconfig.gopls.setup({
      capabilities = capabilities,
    })

    require("lspconfig").efm.setup({
      init_options = { documentFormatting = true },
      filetypes = { "markdown" },
      settings = {
        rootMarkers = { ".git/" },
      },
    })

    -- Eslint
    lspconfig.eslint.setup({
      capabilities = capabilities,
      on_attach = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = true
        vim.api.nvim_create_autocmd("BufWritePre", {
          buffer = bufnr,
          command = "EslintFixAll",
        })
      end,
    })
  end,
}

return M

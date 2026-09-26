local M = {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    -- Native client capabilities. Previously this came from
    -- cmp_nvim_lsp.default_capabilities() back when nvim-cmp was in use.
    local capabilities = vim.lsp.protocol.make_client_capabilities()

    -- Lua Language Server
    vim.lsp.config("lua_ls", {
      capabilities = capabilities,
      on_attach = function(client, _)
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
    vim.lsp.config("rust_analyzer", {
      capabilities = capabilities,
      on_attach = function(client, _)
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
    vim.lsp.config("bashls", {
      capabilities = capabilities,
    })

    -- Typescript
    -- `ts_ls` is typescript-language-server, which wraps tsserver. The old
    -- `tsserver` name is a deprecated alias and is removed in lspconfig 3.0.0.
    vim.lsp.config("ts_ls", {
      capabilities = capabilities,
      on_attach = function(client, _)
        client.server_capabilities.documentFormattingProvider = false
      end,
    })

    vim.lsp.config("gopls", {
      capabilities = capabilities,
    })

    -- Eslint
    vim.lsp.config("eslint", {
      capabilities = capabilities,
      on_attach = function(_, bufnr)
        vim.api.nvim_create_autocmd("BufWritePre", {
          buffer = bufnr,
          command = "EslintFixAll",
        })
      end,
    })

    -- `vim.lsp.enable` resolves the config in lspconfig's `lsp/` directory and
    -- starts the server lazily, the first time a matching filetype is opened.
    vim.lsp.enable({
      "lua_ls",
      "rust_analyzer",
      "bashls",
      "ts_ls",
      "gopls",
      "eslint",
    })

    -- Native completion, replacing nvim-cmp and its sources. Clients get
    -- enabled per buffer as they attach. `omnifunc` is what makes <C-x><C-o>
    -- work, and is also what applies snippet side effects on <C-y>.
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("lsp.completion", { clear = true }),
      callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if not client then
          return
        end
        vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
        vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
      end,
    })
  end,
}

return M

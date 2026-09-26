local M = {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local capabilities = vim.lsp.protocol.make_client_capabilities()

    -- Lua Language Server
    vim.lsp.config("lua_ls", {
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
        },
      },
    })

    -- Rust Analyser
    vim.lsp.config("rust_analyzer", {
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
    vim.lsp.config("bashls", {
      capabilities = capabilities,
    })

    -- Typescript. ts_ls is typescript-language-server, which wraps tsserver.
    -- `tsserver` is a deprecated alias, removed in lspconfig 3.0.0.
    vim.lsp.config("ts_ls", {
      capabilities = capabilities,
    })

    vim.lsp.config("gopls", {
      capabilities = capabilities,
    })

    -- These all format over LSP with no extra configuration.
    vim.lsp.config("yamlls", {
      capabilities = capabilities,
    })

    vim.lsp.config("jsonls", {
      capabilities = capabilities,
    })

    vim.lsp.config("html", {
      capabilities = capabilities,
    })

    vim.lsp.config("cssls", {
      capabilities = capabilities,
    })

    vim.lsp.config("panache", {
      capabilities = capabilities,
    })

    vim.lsp.config("tombi", {
      capabilities = capabilities,
    })

    -- Solidity, via the Solar language server embedded in Foundry. Reads
    -- foundry.toml itself, so no extra binary is needed. Formatting is left
    -- to `forge fmt`, see the BufWritePost hook below.
    vim.lsp.config("solidity_ls", {
      capabilities = capabilities,
      cmd = { "forge", "lsp" },
      root_markers = { "foundry.toml", ".git" },
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

    -- Starts each server the first time a matching filetype is opened.
    vim.lsp.enable({
      "lua_ls",
      "rust_analyzer",
      "bashls",
      "ts_ls",
      "gopls",
      "eslint",
      "yamlls",
      "jsonls",
      "html",
      "cssls",
      "panache",
      "tombi",
      "solidity_ls",
    })

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("lsp", { clear = true }),
      callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if not client then
          return
        end
        vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
        vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

        -- See :help lsp-lint. Servers with textDocument/willSaveWaitUntil
        -- format as part of the save and need no autocmd.
        if
          not client:supports_method("textDocument/willSaveWaitUntil")
          and client:supports_method("textDocument/formatting")
        then
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = vim.api.nvim_create_augroup("lsp.format", { clear = false }),
            buffer = ev.buf,
            callback = function()
              vim.lsp.buf.format({ bufnr = ev.buf, id = client.id, timeout_ms = 1000 })
            end,
          })
        end
      end,
    })
  end,
}

return M

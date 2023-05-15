return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lspconfig = require("lspconfig")
    -- Lua Language Server
    lspconfig.lua_ls.setup({
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
        },
      },
      vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 }),
    })

    -- Rust Analyser
    lspconfig.rust_analyzer.setup({
      settings = {
        standalone = true,
      },
    })
  end,
}

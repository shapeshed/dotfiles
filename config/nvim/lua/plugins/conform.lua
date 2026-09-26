return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  opts = {
    formatters_by_ft = {
      css = { "prettier" },
      go = { "gofmt" },
      html = { "prettier" },
      javascript = { "prettier" },
      javascriptreact = { "prettier" },
      json = { "prettier" },
      jsonc = { "prettier" },
      lua = { "stylua" },
      markdown = { "prettier" },
      rust = { "rustfmt" },
      typescript = { "prettier" },
      typescriptreact = { "prettier" },
      yaml = { "prettier" },
    },
    lint = {
      javascript = { "eslint" },
      javascriptreact = { "eslint" },
      markdown = { "markdownlint" },
      typescript = { "eslint" },
      typescriptreact = { "eslint" },
    },
    -- Replaces the old BufWritePre `vim.lsp.buf.format()` hook in
    -- config/autocmd.lua. `lsp_format = "fallback"` keeps the previous
    -- behaviour for filetypes that have no conform formatter configured.
    format_on_save = function(buf)
      if vim.g.skip_autoformat or vim.b[buf].skip_autoformat then
        return
      end
      return { timeout_ms = 500, lsp_format = "fallback" }
    end,
  },
}

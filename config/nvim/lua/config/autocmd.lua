-- Restore last cursor position
-- https://github.com/neovim/neovim/issues/16339#issuecomment-1457394370
vim.api.nvim_create_autocmd("BufRead", {
  callback = function(opts)
    vim.api.nvim_create_autocmd("BufWinEnter", {
      once = true,
      buffer = opts.buf,
      callback = function()
        local ft = vim.bo[opts.buf].filetype
        local last_known_line = vim.api.nvim_buf_get_mark(opts.buf, '"')[1]
        if
          not (ft:match("commit") and ft:match("rebase"))
          and last_known_line > 1
          and last_known_line <= vim.api.nvim_buf_line_count(opts.buf)
        then
          vim.api.nvim_feedkeys([[g`"]], "nx", false)
        end
      end,
    })
  end,
})

-- Populates qflist with diangostics
vim.api.nvim_create_augroup("diagnostics", { clear = true })
vim.api.nvim_create_autocmd("DiagnosticChanged", {
  group = "diagnostics",
  callback = function()
    vim.diagnostic.setqflist({ open = false })
  end,
})

vim.api.nvim_create_augroup("Whitespace", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
  group = "Whitespace",
  command = "if !&binary | call format#TrimWhitespace() | endif",
})

vim.api.nvim_create_augroup("Format", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
  group = "Format",
  command = "if !&binary | call format#FormatFile() | endif",
})

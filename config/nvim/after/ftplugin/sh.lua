if vim.fn.executable("shfmt") == 1 then
  vim.bo.formatprg = "shfmt -i 2 -sr -ci"
end

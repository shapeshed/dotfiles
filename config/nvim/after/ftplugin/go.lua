if vim.fn.executable("gofmt") == 1 then
  vim.opt_local.formatprg = "gofmt"
end

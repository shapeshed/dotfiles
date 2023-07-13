if vim.fn.executable("prettier") == 1 then
  vim.bo.formatprg = "prettier --parser markdown"
end

vim.opt_local.spell = true

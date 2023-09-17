if vim.fn.executable("prettier") == 1 then
  vim.bo.formatprg = "prettier --parser json"
end

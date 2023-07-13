if vim.fn.executable('stylua') == 1 then
  vim.opt_local.formatprg = 'stylua --stdin-filepath % --search-parent-directories -'
end

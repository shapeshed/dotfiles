-- if vim.fn.executable("prettier") == 1 then
--   vim.bo.formatprg = "prettier"
-- end

-- if vim.fn.executable("markdownlint") == 1 then
--   vim.cmd("compiler markdownlint")
-- end

-- vim.opt_local.spell = true

-- vim.api.nvim_create_augroup("Lint", { clear = true })
-- vim.api.nvim_create_autocmd("BufWritePost", {
--   group = "Lint",
--   command = "silent make! <afile> | silent redraw!",
-- })

-- vim.api.nvim_create_autocmd("QuickFixCmdPost", {
--   pattern = "[^l]*",
--   command = "cwindow",
--   nested = true,
-- })

-- See: h:api-autocmd, h:augroup

vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
	pattern = { "<buffer>" },
	callback = function()
		vim.cmd([[
   wincmd L
   vert resize 80
   ]])
	end,
})

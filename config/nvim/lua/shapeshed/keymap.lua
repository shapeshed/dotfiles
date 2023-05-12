-- Navigate buffers
vim.keymap.set("n", "<C-h>", ":bprevious<CR>", { silent = true, desc = "Previous buffer" })
vim.keymap.set("n", "<C-l>", ":bnext<CR>", { silent = true, desc = "Next buffer" })
vim.keymap.set("n", "<C-x>", ":bdelete<CR>", { silent = true, desc = "Close buffer" })

vim.keymap.set("n", "<C-Up>", ":resize -2<CR>", { silent = true, desc = "Resize window up" })
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>", { silent = true, desc = "Resize window down" })
vim.keymap.set(
  "n",
  "<C-Left>",
  ":vertical resize -2<CR>",
  { silent = true, desc = "Resize window left" }
)
vim.keymap.set(
  "n",
  "<C-Right>",
  ":vertical resize +2<CR>",
  { silent = true, desc = "Resize window right" }
)

-- vim.keymap.set("n", "<S-h>", "<C-w>h", { silent = true, desc = "Move left" })
-- vim.keymap.set("n", "<S-j>", "<C-w>j", { silent = true, desc = "Move down" })
-- vim.keymap.set("n", "<S-k>", "<C-w>k", { silent = true, desc = "Move up" })
-- vim.keymap.set("n", "<S-l>", "<C-w>l", { silent = true, desc = "Move right" })

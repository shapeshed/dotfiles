vim.cmd("packadd termdebug")
-- stylua: ignore start
vim.g.mapleader       = " "           -- Set leader to SPACE
vim.g.netrw_banner    = 0             -- Disable banner in filebrowser
vim.g.termdebug_wide  = 1
vim.g.termdebug_disasm_window = 1
vim.g.termdebugger    = "rust-gdb"

vim.opt.clipboard     = "unnamedplus" -- Use system clipboard
vim.opt.cursorline    = true          -- Highlight cursor line
vim.opt.expandtab     = true          -- In insert mode add spaces for a tab
vim.opt.ignorecase    = true          -- Ignore case in search
vim.opt.number        = true          -- Show line numbers
vim.opt.smartcase     = true          -- If an uppercase use case
vim.opt.softtabstop   = 4
vim.opt.shiftwidth    = 4
vim.opt.tabstop       = 4
vim.opt.signcolumn    = "yes"
vim.opt.termguicolors = true -- Enable 24-bit RGB color

-- stylua: ignore end

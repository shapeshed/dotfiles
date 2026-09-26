vim.cmd("packadd termdebug")
-- stylua: ignore start
vim.g.mapleader       = " "           -- Set leader to SPACE
vim.g.netrw_banner    = 0             -- Disable banner in filebrowser
vim.g.termdebug_wide  = 1
vim.g.termdebug_disasm_window = 1
vim.g.termdebugger    = "rust-gdb"

vim.opt.clipboard     = "unnamedplus" -- Use system clipboard
vim.opt.cursorline    = true          -- Highdark cursor line
vim.opt.expandtab     = true          -- In insert mode add spaces for a tab
vim.opt.ignorecase    = true          -- Ignore case in search
vim.opt.number        = true          -- Show line numbers
vim.opt.smartcase     = true          -- If an uppercase use case
vim.opt.softtabstop   = 4
vim.opt.shiftwidth    = 4
vim.opt.tabstop       = 4
vim.opt.signcolumn    = "yes"
vim.opt.termguicolors = true -- Enable 24-bit RGB color
vim.opt.background    = "dark"

-- Built-in catppuccin (ships with Neovim, so no plugin needed). It only
-- provides the Latte and Mocha flavours and picks between them from
-- 'background', so this must come after the line above. Use
-- `set background=light` for Latte.
vim.cmd([[colorscheme catppuccin]])

-- Native LSP completion (vim.lsp.completion). "noselect" means the first
-- candidate is not auto-accepted; pick one with <C-y>.
--   <C-x><C-n>  keywords in the current buffer (replaces cmp-buffer)
--   <C-x><C-f>  file names (replaces cmp-path)
vim.opt.completeopt   = "menuone,noselect,popup"

-- stylua: ignore end

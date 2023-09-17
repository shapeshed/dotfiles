local builtin = require("telescope.builtin")
local helpers = require("utils.helpers")

-- Mappings ordered under <LEADER> in a logical namespace
-- for use with which-key (my memory fades..🕱)
-- * b - Buffers
-- * d - Debugger
-- * f - Find
-- * l - LSP
-- * p - Packages
--

vim.keymap.set(
  "t",
  "<ESC>",
  "<C-\\><C-n>",
  { silent = true, desc = "Escape from Terminal mode", noremap = true }
)

local mappings = {
  -- Top level useful commands
  { "n", "<LEADER><LEADER>", "<C-^>", "Open last buffer" },
  { "n", "<LEADER>w", "<CMD>write<CR>", "Save" },
  { "n", "<LEADER>q", "<CMD>q<CR>", "Quit" },
  { "n", "<LEADER>e", "<CMD>Lexplore %:p:h<CR>", "Open File Explorer" },
  --  { "n", "<C-l>", "<CMD>bnext<CR>", "Next buffer" },
  --  { "n", "<C-h>", "<CMD>bprevious<CR>", "Previous buffer" },
  { "n", "<C-x>", "<CMD>bdelete<CR>", "Close buffer" },
  { "n", "<LEADER>T", "<CMD>terminal<CR>", "Open terminal" },

  -- Buffers
  { "n", "<LEADER>bc", "<CMD>bdelete<CR>", "Close buffer" },
  { "n", "<LEADER>bn", "<CMD>bnext<CR>", "Next buffer" },
  { "n", "<LEADER>bp", "<CMD>bprevious<CR>", "Previous buffer" },

  -- Debugger (D) namespace
  { "n", "<LEADER>do", "<CMD>Termdebug<CR>", "Open debugger" },
  { "n", "<LEADER>db", "<CMD>Break<CR>", "Add breakpoint" },
  { "n", "<LEADER>dc", "<CMD>Clear<CR>", "Clear breakpoint" },
  { "n", "<LEADER>dr", "<CMD>Run<CR>", "Run the program" },
  { "n", "<LEADER>ds", "<CMD>Step<CR>", "Step (gdb step)" },
  { "n", "<LEADER>dO", "<CMD>Over<CR>", "Over (gdb next)" },
  { "n", "<LEADER>dC", "<CMD>Continue<CR>", "Continue" },
  { "n", "<LEADER>de", "<CMD>Evaluate<CR>", "Evaluate expression under cursor" },
  { "n", "<LEADER>dg", "<CMD>Gdb<CR>", "Jump to gdb window" },

  -- Find (F) namespace
  { "n", "<LEADER>f'", "<CMD>Telescope marks<CR>", "Find marks" },
  { "n", "<LEADER>fb", "<CMD>Telescope buffers<CR>", "Find buffers" },
  { "n", "<LEADER>fw", "<CMD>Telescope grep_string<CR>", "Find word under cursor" },
  { "n", "<LEADER>fC", "<CMD>Telescope commands<CR>", "Find commands" },
  { "n", "<LEADER>ff", "<CMD>Telescope find_files<CR>", "Find files" },
  {
    "n",
    "<LEADER>fF",
    function()
      builtin.find_files()({ hidden = true, no_ignore = true })
    end,
    "Find all files",
  },
  { "n", "<LEADER>fg", "<CMD>Telescope live_grep<CR>", "Find words" },
  { "n", "<LEADER>fh", "<CMD>Telescope help_tags<CR>", "Find help" },
  { "n", "<LEADER>fm", "<CMD>Telescope man_pages<CR>", "Find man" },

  -- LSP (L) namespace
  { "n", "<LEADER>li", "<CMD>LspInfo<CR>", "LSP information" },
  { "n", "<LEADER>lI", "<CMD>NullLsInfo<CR>", "NullLs information" },
  { "n", "<LEADER>ld", vim.lsp.buf.definition, "Go to definition" },
  { "n", "K", vim.lsp.buf.hover, "Hover info" },
  { "n", "<LEADER>lD", "<CMD>Telescope diagnostics<CR>", "Search diagnostics" },
  { "n", "<LEADER>ls", "<CMD>Telescope lsp_document_symbols<CR>", "Search symbols" },
  { "n", "<LEADER>lk", vim.lsp.buf.hover, "Hover information" },
  { "n", "<LEADER>lr", vim.lsp.buf.rename, "Rename string" },
  { "n", "<LEADER>lS", vim.lsp.buf.signature_help, "Signature help" },

  -- Packages (P) namespace
  { "n", "<LEADER>pi", "<CMD>Lazy install<CR>", "Plugins install" },
  { "n", "<LEADER>ps", "<CMD>Lazy home<CR>", "Plugins status" },
  { "n", "<LEADER>pS", "<CMD>Lazy sync<CR>", "Plugins sync" },
  { "n", "<LEADER>pu", "<CMD>Lazy check<CR>", "Plugins check updates" },
  { "n", "<LEADER>pU", "<CMD>Lazy update<CR>", "Plugins update" },
}

for _, v in pairs(mappings) do
  helpers.setMapping(v[1], v[2], v[3], v[4])
end

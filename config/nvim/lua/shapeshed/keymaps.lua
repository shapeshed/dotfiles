local builtin = require("telescope.builtin")
local lazy = require("lazy")
local gitsigns = require("gitsigns")
local dap = require("dap")

local function setMapping(mode, lhs, rhs, desc)
  vim.keymap.set(mode, lhs, rhs, { silent = true, desc = desc })
end

-- TODO ADD go to definition lsp shizzle

local mappings = {
  -- Top level useful commands
  { "n", "<leader><leader>", "<C-^>", "Open last buffer" },
  { "n", "<leader>w", ":write<CR>", "Save" },
  { "n", "<leader>q", ":q<CR>", "Quit" },
  { "n", "<leader>e", ":Lexplore %:p:h<CR>", "Open File Explorer" },
  { "n", "<leader>t", ":TroubleToggle<CR>", "Toggle Trouble" },
  { "n", "<C-l>", ":bnext<CR>", "Next buffer" },
  { "n", "<C-h>", ":bprevious<CR>", "Previous buffer" },
  { "n", "<C-x>", ":bdelete<CR>", "Close buffer" },

  -- Comment/Uncomment in insert and visual mode
  {
    "n",
    "<leader>/",
    function()
      require("Comment.api").toggle.linewise.count(vim.v.count > 0 and vim.v.count or 1)
    end,
    "Comment line",
  },
  {
    "v",
    "<leader>/",
    function()
      require("Comment.api").toggle.linewise(vim.fn.visualmode())
    end,
    "Comment line",
  },

  -- Buffers
  { "n", "<leader>bc", ":bdelete<CR>", "Close buffer" },
  { "n", "<leader>bn", ":bnext<CR>", "Next buffer" },
  { "n", "<leader>bp", ":bprevious<CR>", "Previous buffer" },
  -- Find
  {
    "n",
    "<leader>f'",
    function()
      builtin.marks()
    end,
    "Find marks",
  },
  {
    "n",
    "<leader>fb",
    function()
      builtin.buffers()
    end,
    "Find buffers",
  },
  {
    "n",
    "<leader>fc",
    function()
      builtin.grep_string()
    end,
    "Find word under cursor",
  },
  {
    "n",
    "<leader>fC",
    function()
      builtin.commands()
    end,
    "Find commands",
  },
  {
    "n",
    "<leader>ff",
    function()
      builtin.find_files()
    end,
    "Find files",
  },
  {
    "n",
    "<leader>fF",
    function()
      builtin.find_files()({ hidden = true, no_ignore = true })
    end,
    "Find all files",
  },
  {
    "n",
    "<leader>fg",
    function()
      builtin.live_grep()
    end,
    "Find words",
  },
  {
    "n",
    "<leader>fh",
    function()
      builtin.help_tags()
    end,
    "Find help",
  },
  {
    "n",
    "<leader>fm",
    function()
      builtin.man_pages()
    end,
    "Find man",
  },
  -- Git
  {
    "n",
    "<leader>gb",
    function()
      builtin.git_branches()
    end,
    "Git branches",
  },
  {
    "n",
    "<leader>gc",
    function()
      builtin.git_commits()
    end,
    "Git commits",
  },
  {
    "n",
    "<leader>gs",
    function()
      builtin.git_status()
    end,
    "Git status",
  },
  {
    "n",
    "<leader>gl",
    function()
      gitsigns.blame_line()
    end,
    "View Git Blame",
  },
  {
    "n",
    "<leader>gp",
    function()
      gitsigns.preview_hunk()
    end,
    "Preview Git hunk",
  },
  {
    "n",
    "<leader>gh",
    function()
      gitsigns.reset_hunk()
    end,
    "Reset Git hunk",
  },
  {
    "n",
    "<leader>gr",
    function()
      gitsigns.reset_buffer()
    end,
    "Reset Git buffer",
  },
  {
    "n",
    "<leader>gs",
    function()
      gitsigns.stage_hunk()
    end,
    "Stage Git hunk",
  },
  {
    "n",
    "<leader>gS",
    function()
      gitsigns.stage_buffer()
    end,
    "Stage Git buffer",
  },
  {
    "n",
    "<leader>gu",
    function()
      gitsigns.undo_stage_hunk()
    end,
    "Unstage Git hunk",
  },
  {
    "n",
    "<leader>gd",
    function()
      gitsigns.diffthis()
    end,
    "View Git diff",
  },
  -- Packages
  {
    "n",
    "<leader>pi",
    function()
      lazy.install()
    end,
    "Plugins install",
  },
  {
    "n",
    "<leader>ps",
    function()
      lazy.home()
    end,
    "Plugins Status",
  },
  {
    "n",
    "<leader>pS",
    function()
      lazy.sync()
    end,
    "Plugins Sync",
  },
  {
    "n",
    "<leader>pu",
    function()
      lazy.check()
    end,
    "Plugins Check Updates",
  },
  {
    "n",
    "<leader>pU",
    function()
      lazy.update()
    end,
    "Plugins Update",
  },
  -- LSP
  { "n", "<leader>li", ":LspInfo<CR>", "LSP Information" },
  { "n", "<leader>lI", ":NullLsInfo<CR>", "NullLs Information" },
  {
    "n",
    "<leader>ld",
    function()
      vim.lsp.buf.definition()
    end,
    "Go to Definition",
  },
  {
    "n",
    "<leader>lD",
    function()
      builtin.diagnostics()
    end,
    "Search diagnostics",
  },
  {
    "n",
    "<leader>ls",
    function()
      builtin.lsp_document_symbols()
    end,
    "Search symbols",
  },
  {
    "n",
    "<leader>lk",
    function()
      vim.lsp.buf.hover()
    end,
    "Hover information",
  },
  {
    "n",
    "<leader>lr",
    function()
      vim.lsp.buf.rename()
    end,
    "Rename string",
  },
  {
    "n",
    "<leader>lS",
    function()
      vim.lsp.buf.signature_help()
    end,
    "Signature help",
  },
  -- Debugger
  {
    "n",
    "<leader>dc",
    function()
      dap.continue()
    end,
    "Continue",
  },
  {
    "n",
    "<leader>db",
    function()
      dap.toggle_breakpoint()
    end,
    "Toggle Breakpoint",
  },
  {
    "n",
    "<leader>di",
    function()
      dap.step_into()
    end,
    "Step Into",
  },
  {
    "n",
    "<leader>dO",
    function()
      dap.step_out()
    end,
    "Step Out",
  },
  {
    "n",
    "<leader>do",
    function()
      dap.step_over()
    end,
  },
  {
    "n",
    "<leader>dp",
    function()
      dap.pause()
    end,
    "Pause Debugger",
  },
  {
    "n",
    "<leader>dq",
    function()
      dap.close()
    end,
    "Close Session",
  },
  {
    "n",
    "<leader>dQ",
    function()
      dap.close()
    end,
    "Terminate Session",
  },
  {
    "n",
    "<leader>dR",
    function()
      dap.restart_frame()
    end,
    "Restart Debugger",
  },
}

for _, v in pairs(mappings) do
  setMapping(v[1], v[2], v[3], v[4])
end

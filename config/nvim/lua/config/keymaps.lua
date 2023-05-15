local builtin = require("telescope.builtin")
local lazy = require("lazy")
local dap = require("dap")
local dapui = require("dapui")
local helpers = require("utils.helpers")

-- Mappings ordered under <leader> in a logical namespace
-- for use with which-key (my memory fades..)
-- * b - Buffers
-- * d - Debugger
-- * f - Find
-- * g - Git
-- * l - LSP
-- * p - Packages

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

  -- Debugger (D) namespace
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
    "<leader>dB",
    function()
      vim.ui.input({ prompt = "Condition: " }, function(expr)
        if expr then
          dap.toggle_breakpoint(expr)
        end
      end)
    end,
    "Conditional breakpoint",
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
    "Step Over",
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
  {
    "n",
    "<leader>dE",
    function()
      vim.ui.input({ prompt = "Expression: " }, function(expr)
        if expr then
          dapui.eval(expr)
        end
      end)
    end,
    "Evaluate Input",
  },
  {
    "v",
    "<leader>dE",
    function()
      dapui.eval()
    end,
    "Evaluate Input",
  },
  {
    "n",
    "<leader>du",
    function()
      dapui.toggle()
    end,
    "Toggle Debugger UI",
  },
  {
    "n",
    "<leader>dh",
    function()
      dapui.hover()
    end,
    "Debugger Hover",
  },

  -- Find (F) namespace
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

  -- LSP (L) namespace
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

  -- Packages (P) namespace
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
}

for _, v in pairs(mappings) do
  helpers.setMapping(v[1], v[2], v[3], v[4])
end

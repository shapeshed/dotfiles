local builtin = require("telescope.builtin")

local function setMapping(mode, lhs, rhs, desc)
  vim.keymap.set(mode, lhs, rhs, { silent = true, desc = desc })
end

local mappings = {
  -- Top level useful commands
  { "n", "<leader><leader>", "<C-^>", "Open last buffer" },
  { "n", "<leader>w", ":write<CR>", "Save" },
  { "n", "<leader>q", ":q<CR>", "Quit" },
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
}

for _, v in pairs(mappings) do
  setMapping(v[1], v[2], v[3], v[4])
end

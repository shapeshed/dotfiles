local M = {
  "folke/which-key.nvim",
  event = "VeryLazy",
  -- Provides the filetype icons used by the `icons.rules` patterns below.
  -- No icon provider: which-key falls back to the WhichKeyIcon highlight
  -- group, and the colour-based rules in icons.rules still apply.
  opts = {
    plugins = {
      marks = true, -- shows a list of your marks on ' and `
      registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
      -- the presets plugin, adds help for a bunch of default keybindings in Neovim
      -- No actual key bindings are created
      spelling = {
        enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
        suggestions = 20, -- how many suggestions should be shown in the list?
      },
      presets = {
        operators = true, -- adds help for operators like d, y, ...
        motions = true, -- adds help for motions
        text_objects = true, -- help for text objects triggered after entering an operator
        windows = true, -- default bindings on <c-w>
        nav = true, -- misc bindings to work with windows
        z = true, -- bindings for folds, spelling and others prefixed with z
        g = true, -- bindings for prefixed with g
      },
    },
    icons = {
      breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
      separator = "", -- symbol used between a key and it's label
      group = "", -- symbol prepended to a group
      -- Icons are resolved from these rules by matching the group/description
      -- text, so don't hardcode nerd font glyphs into the labels themselves or
      -- they will be doubled up. These two have no built-in rule.
      rules = {
        { pattern = "lsp", icon = "󰗡", color = "blue" },
        { pattern = "package", icon = "󰏖", color = "purple" },
      },
    },
    keys = {
      scroll_down = "<c-d>", -- binding to scroll down inside the popup
      scroll_up = "<c-u>", -- binding to scroll up inside the popup
    },
    -- the default `classic` preset already gives us border = "none", row = -1 (bottom)
    -- and height = { min = 4, max = 25 }
    win = {
      padding = { 1, 2 }, -- extra window padding [top/bottom, right/left]
      zindex = 1000, -- positive value to position WhichKey above other floating windows.
    },
    layout = {
      width = { min = 20, max = 50 }, -- min and max width of the columns
      spacing = 3, -- spacing between columns
    },
    -- show the popup immediately for the plugin triggers (marks, registers,
    -- spelling) and for <leader>, otherwise wait a moment
    delay = function(ctx)
      if ctx.plugin or ctx.keys:find("<leader>", 1, true) then
        return 0
      end
      return 200
    end,
    show_help = true, -- show a help message in the command line for using WhichKey
    show_keys = true, -- show the currently pressed key and its label as a message in the command line
    -- disable the WhichKey popup for certain buf types and file types.
    -- Disabled by default for Telescope
    disable = {
      ft = {},
      bt = {},
    },
  },
  config = function(_, opts)
    vim.o.timeout = true
    vim.o.timeoutlen = 300
    local wk = require("which-key")
    require("which-key").setup(opts)

    wk.add({
      { "<leader>b", group = "Buffers" },
      { "<leader>d", group = "Debugger" },
      { "<leader>f", group = "Find" },
      { "<leader>l", group = "LSP" },
      { "<leader>p", group = "Packages" },
    })
  end,
}

return M

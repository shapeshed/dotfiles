return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function(_, _)
      local builtin = require("telescope.builtin")
      local helpers = require("utils.helpers")
      local mappings = {
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
      }
      for _, v in pairs(mappings) do
        helpers.setMapping(v[1], v[2], v[3], v[4])
      end
    end,
  },
}

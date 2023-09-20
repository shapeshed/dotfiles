local M = {
  "jackMort/ChatGPT.nvim",
  event = "VeryLazy",
  config = function()
    require("chatgpt").setup({
      api_key_cmd = "echo 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",
    })
  end,
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
}

return M

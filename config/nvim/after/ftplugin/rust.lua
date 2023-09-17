local helpers = require("utils.helpers")

if vim.fn.executable("cargo") == 1 then
  vim.cmd("compiler cargo")
end

vim.api.nvim_create_autocmd("QuickFixCmdPost", {
  pattern = "[^l]*",
  command = "cwindow",
  nested = true,
})

local mappings = {
  -- Top level useful commands
  { "n", "<LEADER>m", ":silent make build|redraw!|cc<CR>", "Run make build" },
}

for _, v in pairs(mappings) do
  helpers.setMapping(v[1], v[2], v[3], v[4])
end

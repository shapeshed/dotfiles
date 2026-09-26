-- Treat .html files containing Go template actions as a template filetype, so
-- they get treesitter highlighting and the right LSP. Uses nvim_buf_get_lines
-- rather than vim.filetype.getlines, which was renamed to the private
-- _getlines in Neovim 0.12.
vim.filetype.add({
  pattern = {
    [".*/.*%.html"] = {
      priority = -math.huge,
      function(_, bufnr)
        local lines = vim.api.nvim_buf_get_lines(bufnr, 0, 5, false)
        for _, line in ipairs(lines) do
          if line:find("{{.*}}") then
            return "gohtmltmpl"
          end
        end
        return "html"
      end,
    },
  },
})

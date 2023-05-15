local getlines = vim.filetype.getlines

vim.filetype.add({
  --extension = {
  --  foo = "fooscript",
  --},
  --filename = {
  --  [".foorc"] = "toml",
  --  ["/etc/foo/config"] = "toml",
  --},
  pattern = {
    [".*/.*%.html"] = {
      priority = -math.huge,
      function(_, bufnr)
        for _, line in ipairs(getlines(bufnr, 1, 5)) do
          if line:find("{{.*}}") then
            return "gohtmltmpl"
          else
            return "html"
          end
        end
      end,
    },
  },
})

-- nvim-treesitter `main` branch (a full rewrite of `master`).
-- * does not support lazy-loading, so this loads on startup
-- * `nvim-treesitter.configs` is gone; parsers are installed via
--   `require('nvim-treesitter').install()`
-- * highlighting is not automatic; it is started per-filetype below
return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  build = ":TSUpdate",
  lazy = false,
  config = function()
    local parsers = {
      "c",
      "css",
      "go",
      "gotmpl",
      "html",
      "javascript",
      "lua",
      "rust",
      "solidity",
      "typescript",
    }

    -- `install` is a no-op for parsers that are already present, but filter
    -- first so a normal startup does no work at all.
    local installed = {}
    for _, parser in ipairs(require("nvim-treesitter").get_installed()) do
      installed[parser] = true
    end

    local missing = {}
    for _, parser in ipairs(parsers) do
      if not installed[parser] then
        table.insert(missing, parser)
      end
    end
    if #missing > 0 then
      require("nvim-treesitter").install(missing):wait(300000)
    end

    -- Highlighting is provided by Neovim itself now, so start it per-filetype.
    vim.api.nvim_create_autocmd("FileType", {
      pattern = parsers,
      callback = function(ev)
        local lang = vim.treesitter.language.get_lang(ev.match)
        if lang and pcall(vim.treesitter.language.inspect, lang) then
          vim.treesitter.start(ev.buf, lang)
        end
      end,
    })
  end,
}

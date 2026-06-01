return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function ()
    local configs = require("nvim-treesitter")

    configs.setup({
      ensure_installed = { "cpp", "c", "cmake", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html", "go", "marksman" },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}

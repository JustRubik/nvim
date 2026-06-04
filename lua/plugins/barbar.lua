return {
  {'romgrk/barbar.nvim',
    dependencies = {
      -- 'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    init = function() vim.g.barbar_auto_setup = false end,
    opts = {
      -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
      animation = false,
      auto_hide = false,
      tabpages = true,
      clickable = true,
      preset = 'powerline',
      -- highlight_current_file_icons = false,
      icons = {
        filetype = { custom_color = true, },
        separator = { left = '', right = '' },
        separator_at_end = false,
        inactive = { separator = { left = '', right = '' } },
      },
      -- insert_at_start = true,
      -- …etc.
    },
    version = '^1.0.0', -- optional: only update when a new 1.x version is released
  },
}

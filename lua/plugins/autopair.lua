return {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true,
    -- use opts = {} for passing setup options
    -- this is equivalent to setup({}) function
    opts = {
      check_ts = true,

      -- disable_filetype = 'TelescopePrompt',

      fast_wrap = {},

      disable_in_macro = true,
    },
}

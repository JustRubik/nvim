return {
	"xiyaowong/transparent.nvim",
	config = function()
		require("transparent").setup({
			enable = true,
      -- priority = 1000,
			extra_groups = {
				"Normal",
				"NormalNC",
				"TelescopeBorder",
				"NvimTreeNormal",
				"LualineNormal",
				"FzfLuaBorder",
				"FzfLuaNormal",
				"FzfLuaTitle",
				"FzfLuaPreviewBorder",
				"FzfLuaPreviewNormal",
				"FzfLuaPreviewTitle",
			},
		})
		require("transparent").clear_prefix("NeoTree")
		require("transparent").clear_prefix("lualine")
		require("transparent").clear_prefix("StatusLine")
		require("transparent").clear_prefix("Buffer")
		require("transparent").clear_prefix("TabLine")

		-- depends on pc, these settings are needed
        vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
		vim.cmd("highlight Normal guibg=NONE")
		vim.cmd("highlight Lualine guibg=NONE")
		vim.cmd("highlight Lualine guifg=NONE")
		vim.cmd("highlight NormalNC guibg=NONE")
		vim.cmd("highlight CursorLine guibg=NONE")
        -- vim.cmd("highlight WinSeparator guifg=NONE")
	end,
}

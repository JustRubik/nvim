return {
	{
		"alligator/accent.vim",
		name = "accent",
	  priority = 999,
		config = function()
			-- Set default theme
			local themes = {
				"accent", -- this guy is for my eyes
				"tokyonight", -- for recording
				"catppuccin", -- for recording
				"rose-pine", -- for fun
			}
      
      local current_theme_index = 2
      -- Set default theme (first theme)
      vim.cmd.colorscheme(themes[current_theme_index])
      vim.api.nvim_set_hl(0, "Comment", { fg = "#a0a0a0" })

			-- Key mapping to switch themes (e.g., <leader>nt)
			vim.keymap.set("n", "<leader>nt", function()
				current_theme_index = current_theme_index + 1
				if current_theme_index > #themes then
					current_theme_index = 1
				end
				local theme = themes[current_theme_index]
				vim.cmd.colorscheme(theme)
				print("Changed nvim theme to: " .. theme)
			end, { noremap = true, silent = true })
		end,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 800,
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		priority = 1000,
	},
	{
	  "folke/tokyonight.nvim",
		name = "tokyonight",
		priority = 1100,
	},
}

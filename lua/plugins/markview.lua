-- For `plugins/markview.lua` users.
return {
	"OXY2DEV/markview.nvim",
	lazy = false,
	priority = -100,
	-- dependencies = {
	--     "themes"
	-- },
	--
	config = function()
    vim.keymap.set("n", "<leader>m", "<CMD>Markview toggle<CR>", {
      desc = "Toggle Markview",
    })
	end,
}

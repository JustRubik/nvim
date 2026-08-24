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
        -- default
        vim.cmd("Markview enable")
        -- vim.cmd("set nowrap")

		local function toggle_markview()
			if require("markview").enable then
			    vim.cmd("Markview disable")
				vim.cmd("set wrap")
			else
                vim.cmd("Markview enable")
				vim.cmd("set nowrap")
			end
		end

		vim.keymap.set("n", "<leader>m", toggle_markview, {
			desc = "Toggle Markview",
		})
	end,
}

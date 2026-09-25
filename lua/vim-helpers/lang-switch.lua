local M = {}

function M.setup()
	if vim.loop.os_uname().sysname:find("Windows") == nil then
		vim.api.nvim_create_autocmd("InsertLeave", {
			callback = function()
				vim.fn.system("fcitx5-remote -c")
			end,
		})
	end
end

return M

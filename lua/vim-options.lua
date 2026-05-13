vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "
vim.cmd("set number")
vim.cmd("set relativenumber")
vim.cmd("set cursorline")
vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "white" })
vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#ead84e" })
vim.api.nvim_set_option("clipboard", "unnamed")
vim.opt.hlsearch = true
vim.opt.incsearch = true
-- move selected lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
-- paste over highlight word
vim.keymap.set("x", "<leader>p", '"_dP')
vim.opt.colorcolumn = "94"
vim.opt.clipboard = "unnamedplus"
-- fk llm-ls
local notify_original = vim.notify
vim.notify = function(msg, ...)
	if
		msg
		and (
			msg:match("position_encoding param is required")
			or msg:match("Defaulting to position encoding of the first client")
			or msg:match("multiple different client offset_encodings")
		)
	then
		return
	end
	return notify_original(msg, ...)
end
--vim.opt.swapfile = false

-- Keymap
vim.keymap.set("n", "<A-h>", ":vertical resize -1<CR>")
vim.keymap.set("n", "<A-l>", ":vertical resize +1<CR>")
vim.keymap.set("n", "<A-k>", ":resize +1<CR>")
vim.keymap.set("n", "<A-j>", ":resize -1<CR>")

-- Kiểm tra nếu đang chạy trên Windows
if vim.fn.has("win32") == 1 then
    -- Ưu tiên pwsh (PowerShell Core) nếu có, nếu không thì dùng powershell mặc định
    local powershell_exe = vim.fn.executable("pwsh") == 1 and "pwsh" or "powershell"

    vim.opt.shell = powershell_exe
    vim.opt.shellcmdflag = "-NoLogo -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
    vim.opt.shellredir = "2>&1 | Out-File -Encoding UTF8 %s"
    vim.opt.shellpipe = "2>&1 | Out-File -Encoding UTF8 %s"
    vim.opt.shellquote = ""
    vim.opt.shellxquote = ""
end


-- start barbar config
-- next/prev buffer
vim.keymap.set("n", "<S-l>", "<Cmd>BufferNext<CR>")
vim.keymap.set("n", "<S-h>", "<Cmd>BufferPrevious<CR>")

-- close buffer
vim.keymap.set("n", "<leader>q", "<Cmd>BufferClose<CR>")
-- end barbar config

vim.keymap.set("n", "<leader>vt", ":ShowTree<CR>", { desc = "Show directory tree in floating window" })

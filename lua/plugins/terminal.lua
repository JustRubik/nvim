-- Terminal
return {
    "terminal",
    dir = vim.fn.stdpath("config"),
    virtual = true,
    config = function()
        local term_buf = nil
        local term_win = nil

        _G.ToggleTerminal = function()
            if term_win and vim.api.nvim_win_is_valid(term_win) then
                vim.api.nvim_win_hide(term_win)
                term_win = nil
            else
                vim.cmd("botright vsplit") -- Mở ở bên phải 
                vim.cmd("vertical resize 30") -- Chiều rộng terminal là 30
                if term_buf and vim.api.nvim_buf_is_valid(term_buf) then
                    vim.api.nvim_set_current_buf(term_buf)
                else
                    vim.cmd("terminal")
                    term_buf = vim.api.nvim_get_current_buf()
                end
                term_win = vim.api.nvim_get_current_win()
                vim.cmd("startinsert") -- Tự động vào chế độ Insert
            end
        end

        -- Gán phím tắt Ctrl + t để Toggle
        vim.keymap.set({ 'n', 't' }, '<C-t><C-t>', '<CMD>lua ToggleTerminal()<CR>', { noremap = true })
        vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], {})
        vim.keymap.set('t', '<C-t>t', [[<C-\><C-n>:q!<CR>]], {})
        vim.keymap.set({'n', 't'}, '<C-t><C-h>', '<CMD>:term pwsh<CR>', {}) -- Trong trường hợp dùng windows
        vim.keymap.set({'n', 't'}, '<C-t><C-j>', '<CMD>:term zsh<CR>', {}) -- Trong trường hợp dùng linux
    end
}

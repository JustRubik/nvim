local M = {}

function M.setup()
  vim.api.nvim_create_autocmd("InsertLeave", {
    callback = function ()
      vim.fn.system("fcitx5-remote -c")
    end,
  })
end

return M

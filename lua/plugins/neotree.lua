return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    config = function ()
        vim.keymap.set("n", "<leader>v", ":Neotree filesystem toggle left<CR>", {})
        require("neo-tree").setup({
          window = {
               width = 25,
          },
          filesystem = {
            filtered_items = {
              visible = true,  -- Hiện file ẩn
              hide_dotfiles = false,
              hide_gitignored = false,
            },
          },
        })

    end,
}

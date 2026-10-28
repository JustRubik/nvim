return {
	"kevalin/mermaid.nvim",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	config = function()
		require("mermaid").setup({
			format = {
				shift_width = 2, -- Indentation size (spaces)
			},
			lint = {
				enabled = true, -- Enable diagnostics via mmdc
				command = "mmdc", -- Path to mermaid-cli executable
			},
			preview = {
				port = 0, -- Server port (0 or nil for random available port)
				renderer = "mermaid.js", -- "mermaid.js" or "beautiful-mermaid"
				theme = "default", -- Theme name (renderer-specific)
			},
		})
		-- Install the Tree-sitter parser:
		-- :TSInstall mermaid
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "mermaid",
			callback = function()
				local buf = vim.api.nvim_get_current_buf()
				vim.keymap.set("n", "<leader>mp", "<cmd>MermaidPreview<CR>", { buffer = buf, desc = "Mermaid Preview" }) -- Open live browser preview
				vim.keymap.set("n", "<leader>mf", "<cmd>MermaidFormat<CR>", { buffer = buf, desc = "Mermaid Format" }) -- Auto-format current buffer
				vim.keymap.set("n", "<leader>mr", "<cmd>MermaidRender<CR>", { buffer = buf, desc = "Mermaid Render" }) -- Render inline in Kitty
				vim.keymap.set("n", "<leader>mc", "<cmd>MermaidCopyURL<CR>", { buffer = buf, desc = "Mermaid Copy URL" }) -- Copy preview URLs to clipboard
				vim.keymap.set("n", "<leader>mx", "<cmd>MermaidPreviewStop<CR>", { buffer = buf, desc = "Mermaid Stop Preview" }) -- Stop the preview server
			end,
		})
	end,
}

return {
  {
    "williamboman/mason.nvim",
    config = function () 
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function ()
      require("mason-lspconfig").setup {
        ensure_installed = {"lua_ls"},
      }
    end,
  },
  {
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
            --local lspconfig = require("lspconfig")
            local lspconfig = vim.lsp.config
			-- lua
			lspconfig['lua_ls'] = {
				cmd = { "lua-language-server" },
				capabilities = capabilities,
				settings = {
					Lua = {
                        runtime = {
                            version = 'LuaJIT',
                        },
						diagnostics = {
							globals = { "vim" },
						},
						workspace = {
							library = vim.api.nvim_get_runtime_file("", true),
							checkThirdParty = false,
						},
						telemetry = {
							enable = false,
						},
					},
				},
			}
            vim.lsp.enable("lua_ls")

			-- typescript
		    lspconfig['ts_ls'] = {
				capabilities = capabilities,
			}
            vim.lsp.enable("ts_ls")

			-- Js
			lspconfig['eslint'] = {
				capabilities = capabilities,
			}
            vim.lsp.enable("eslint")

			-- zig
			lspconfig['zls'] = {
				capabilities = capabilities,
			}
            vim.lsp.enable("zls")

			-- yaml
			lspconfig['yamlls'] = {
				capabilities = capabilities,
			}
            vim.lsp.enable("yamlls")

			-- tailwindcss
			--lspconfig['tailwindcss'] = {
			--	capabilities = capabilities,
			--}
            --vim.lsp.enable("tailwindcss")

			-- golang
			lspconfig['gopls'] = {
				capabilities = capabilities,
			}
            vim.lsp.enable("gopls")

			--java
			-- lspconfig.jdtls.setup({
			--     settings = {
			--         java = {
			--             configuration = {
			--                 runtimes = {
			--                     {
			--                         name = "JavaSE-23",
			--                         path = "/opt/homebrew/Cellar/openjdk/23.0.2/libexec/openjdk.jdk/Contents/Home",
			--                         default = true,
			--                     },
			--                 },
			--             },
			--         },
			--     },
			-- })

			-- nix
			lspconfig['rnix'] = { 
                capabilities = capabilities,
            }
            vim.lsp.enable("rnix")

			-- protocol buffer
			--lspconfig.buf_ls.setup({ capabilities = capabilities })

			-- docker compose
			lspconfig['docker_compose_language_service'] = { 
                capabilities = capabilities,
            }
            vim.lsp.enable("docker_compose_language_service")

			-- svelte
			--lspconfig['svelte'] = { 
            --    capabilities = capabilities,
            --}

			-- python
			lspconfig['pylsp'] = { 
                capabilities = capabilities, 
            }
            vim.lsp.enable("pylsp")

			-- bash
			lspconfig['bashls'] = { 
                capabilities = capabilities 
            }
            vim.lsp.enable("bashls")

            -- clang
			lspconfig['clangd'] = {
				capabilities = capabilities,
			}
            vim.lsp.enable("clangd")

			-- lsp kepmap setting
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
			vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
			-- list all methods in a file
			-- working with go confirmed, don't know about other, keep changing as necessary
			vim.keymap.set("n", "<leader>fm", function()
				local filetype = vim.bo.filetype
				local symbols_map = {
					python = "function",
					javascript = "function",
					typescript = "function",
					java = "class",
					lua = "function",
					go = { "method", "struct", "interface" },
				}
				local symbols = symbols_map[filetype] or "function"
				require("fzf-lua").lsp_document_symbols({ symbols = symbols })
			end, {})
		end,
	},
}

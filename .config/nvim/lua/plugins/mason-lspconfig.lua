return {
	{
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",

		event = "BufReadPre",

		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					-- Lua
					"lua_ls",
					"stylua",

					-- Web Development
					"typescript-language-server",
					"css-lsp",
					"html-lsp",
					"eslint_d",
					"rustywind",

					-- C/C++
					"clangd",
					"clang-format",

					-- Python
					"isort",
					"black",
					"flake8",
					"pyright",

					-- Bash
					"beautysh",
					"bash-language-server",
				},
				automatic_installation = true,
			})
		end,
	},
}

return {
	"neovim/nvim-lspconfig",

	dependencies = {
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},

	config = function()
		local capabilities = require("cmp_nvim_lsp").default_capabilities()
		local lspconfig = require("lspconfig")

		lspconfig.lua_ls.setup({
			capabilities = capabilities,
		})

		lspconfig.pyright.setup({
			capabilities = capabilities,
		})

		lspconfig.eslint.setup({
			capabilities = capabilities,
		})

		lspconfig.ts_ls.setup({
			capabilities = capabilities,
		})

		lspconfig.cssls.setup({
			capabilities = capabilities,
		})

		lspconfig.html.setup({
			capabilities = capabilities,
		})

		lspconfig.clangd.setup({

			cmd = {
				"clangd",
				"--fallback-style=webkit",
			},
			capabilities = capabilities,
		})

		lspconfig.bashls.setup({
			capabilities = capabilities,
		})

		vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
		vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "[C]ode [A]ction" }, {})
	end,
}

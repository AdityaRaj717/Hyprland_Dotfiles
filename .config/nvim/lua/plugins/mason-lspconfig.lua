return {
    {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",

        event = "BufReadPre",

        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "tailwindcss-language-server",
                    "typescript-language-server",
                    "css-lsp",
                },
                automatic_installation = true,
            })
        end,
    },
}

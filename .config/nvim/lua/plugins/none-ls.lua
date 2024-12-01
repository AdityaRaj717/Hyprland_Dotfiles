return {
    "nvimtools/none-ls.nvim",

    dependencies = {
        "nvimtools/none-ls-extras.nvim",
    },

    config = function()
        local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
        local null_ls = require("null-ls")

        null_ls.setup({

            -- Format on save
            on_attach = function(client, bufnr)
                if client.supports_method("textDocument/formatting") then
                    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        group = augroup,
                        buffer = bufnr,
                        callback = function()
                            vim.lsp.buf.format({ async = false })
                        end,
                    })
                end
            end,

            sources = {
                -- Lua
                null_ls.builtins.formatting.stylua,

                -- Python
                null_ls.builtins.formatting.black,
                null_ls.builtins.formatting.isort,
                require("none-ls.diagnostics.flake8"),

                -- C/C++
                null_ls.builtins.formatting.clang_format.with({

                    extra_args = {
                        "-style={ \
                        BasedOnStyle: LLVM, \
                        IndentWidth: 4, \
                        TabWidth: 4, \
                        UseTab: Never, \
                        AccessModifierOffset: 0, \
                        IndentAccessModifiers: true, \
                        PackConstructorInitializers: Never, \
                        }",
                    },
                }),

                -- Rust/HTML/CSS/JavaScript/TypeScript
                null_ls.builtins.formatting.rustywind,
                require("none-ls.diagnostics.eslint_d"),

                -- Bash
                require("none-ls.formatting.beautysh"),
            },
        })

        vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, { desc = "[F]ormat File" }, {})
    end,
}

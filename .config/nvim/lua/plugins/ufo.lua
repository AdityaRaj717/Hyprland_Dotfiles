return {
    {
        "kevinhwang91/nvim-ufo",
        dependencies = {
            "kevinhwang91/promise-async",
            {
                "luukvbaal/statuscol.nvim",
                config = function()
                    local builtin = require("statuscol.builtin")
                    require("statuscol").setup({
                        relculright = true,
                        segments = {
                            { text = { builtin.foldfunc },      click = "v:lua.ScFa" },
                            { text = { "%s" },                  click = "v:lua.ScSa" },
                            { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
                        },
                    })
                end,
            },
        },

        config = function()
            require("ufo").setup({
                open_fold_hl_timeout = 150,
                close_fold_kinds_for_ft = {
                    default = { "imports", "comment" },
                    json = { "array" },
                    c = { "comment", "region" },
                },
                preview = {
                    win_config = {
                        border = { "", "─", "", "", "", "─", "", "" },
                        winhighlight = "Normal:Folded",
                        winblend = 0,
                    },
                    mappings = {
                        scrollU = "<C-u>",
                        scrollD = "<C-d>",
                        jumpTop = "[",
                        jumpBot = "]",
                    },
                },
                provider_selector = function(bufnr, filetype, buftype)
                    -- if you prefer treesitter provider rather than lsp,
                    -- return ftMap[filetype] or {'treesitter', 'indent'}
                    return { --[[ "lsp",  ]]
                        "treesitter",
                        "indent",
                    }

                    -- refer to ./doc/example.lua for detail
                end,
            })
            -- UFO
            vim.keymap.set("n", "zR", require("ufo").openAllFolds)
            vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
            vim.keymap.set("n", "zr", require("ufo").openFoldsExceptKinds)
            vim.keymap.set("n", "zm", require("ufo").closeFoldsWith)
        end,
        -- Folding preview, by default h and l keys are used.
        -- On first press of h key, when cursor is on a closed fold, the preview will be shown.
        -- On second press the preview will be closed and fold will be opened.
        -- When preview is opened, the l key will close it and open fold. In all other cases these keys will work as usual.
        -- { "anuvyklack/fold-preview.nvim", dependencies = "anuvyklack/keymap-amend.nvim", config = true },
    },
}

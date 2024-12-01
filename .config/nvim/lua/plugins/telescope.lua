return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        -- or                              , branch = '0.1.x',
        dependencies = {
            {
                "nvim-lua/plenary.nvim",
                "nvim-lua/popup.nvim",
                "jvgrootveld/telescope-zoxide",
            },

            {
                "nvchad/ui",
                config = function()
                    require("nvchad")
                end,
            },

            {
                "nvchad/base46",
                lazy = true,
                build = function()
                    require("base46").load_all_highlights()
                end,
            },

            { "nvchad/volt" }, -- optional, needed for theme switcher
            -- or just use Telescope themes
        },

        lazy = false,

        config = function()
            require("telescope").setup({
                defaults = {
                    -- Default configuration for telescope goes here:
                    -- config_key = value,
                    mappings = {
                        i = {
                            -- map actions.which_key to <C-h> (default: <C-/>)
                            -- actions.which_key shows the mappings for your picker,
                            -- e.g. git_{create, delete, ...}_branch for the git_branches picker
                            -- ["<C-h>"] = "which_key",
                        },

                        n = {
                            -- Closing buffers with "d"
                            ["d"] = require("telescope.actions").delete_buffer,
                            -- Quitting bufexplorer with q
                            ["q"] = require("telescope.actions").close,
                        },
                    },
                },
                pickers = {
                    -- Default configuration for builtin pickers goes here:
                    -- picker_name = {
                    --   picker_config_key = value,
                    --   ...
                    -- }
                    -- Now the picker_config_key will be applied every time you call this
                    -- builtin picker
                    find_files = { hidden = true },
                },
                extensions = {
                    -- Your extension configuration goes here:
                    -- extension_name = {
                    --   extension_config_key = value,
                    -- }
                    -- please take a look at the readme of the extension you want to configure
                    zoxide = {
                        {
                            prompt_title = "[ Zoxide List ]",

                            -- Zoxide list command with score
                            list_command = "zoxide query -ls",
                            mappings = {
                                default = {
                                    action = function(selection)
                                        vim.cmd.cd(selection.path)
                                    end,
                                    after_action = function(selection)
                                        vim.notify("Directory changed to " .. selection.path)
                                    end,
                                },
                                -- local z_utils = require("telescope._extensions.zoxide.utils")
                                ["zs"] = {
                                    action = require("telescope._extensions.zoxide.utils").create_basic_command(
                                        "split"
                                    ),
                                },
                                ["vsiz"] = {
                                    action = require("telescope._extensions.zoxide.utils").create_basic_command(
                                        "vsplit"
                                    ),
                                },
                                ["ze"] = {
                                    action = require("telescope._extensions.zoxide.utils").create_basic_command("edit"),
                                },
                                -- ["<C-f>"] = {
                                --     keepinsert = true,
                                --     action = function(selection)
                                --         builtin.find_files({ cwd = selection.path })
                                --     end,
                                -- },
                                ["<C-t>"] = {
                                    action = function(selection)
                                        vim.cmd.tcd(selection.path)
                                    end,
                                },
                            },
                        },
                    },
                },
            })
            require("telescope").load_extension("zoxide")

            -- Open Zoxide telescope extension
            vim.keymap.set(
                "n",
                "<leader>zi",
                require("telescope").extensions.zoxide.list,
                { desc = "[T]elescope Zoxide" },
                {}
            )
        end,

        keys = {
            vim.keymap.set("n", "<leader>fk", ":Telescope keymaps<CR>", { desc = "[T]elescope Keymaps" }),
            vim.keymap.set("n", "<leader>fh", ":Telescope help_tags<CR>", { desc = "[T]elescope Help" }),
            vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", { desc = "[T]elescope Find Files" }),
            vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>", { desc = "[T]elescope Live Grep" }),
            vim.keymap.set("n", "<leader>fb", ":Telescope buffers<CR>", { desc = "[T]elescope Buffers" }),
            vim.keymap.set("n", "<leader>ft", ":TodoTelescope<CR>", { desc = "[T]elescope Buffers" }),
            vim.keymap.set(
                "n",
                "<S-h>",
                "<cmd>Telescope buffers sort_mru=true sort_lastused=true initial_mode=normal theme=ivy<cr>",
                { desc = "[T]elescope buffers" }
            ),
            vim.keymap.set("n", "<leader>cl", "<cmd>Telescope neoclip <cr>", { desc = "[O]pen telescope neoclip" }),
            vim.keymap.set(
                "n",
                "<leader>fd",
                require("telescope.builtin").diagnostics,
                { desc = "[T]elescope Diagnostics" }
            ),
            vim.keymap.set(
                "n",
                "<leader>fs",
                require("telescope.builtin").lsp_document_symbols,
                { desc = "[T]elescope Document Symbols" }
            ),
            vim.keymap.set("n", "<leader>/", function()
                -- You can pass additional configuration to Telescope to change the theme, layout, etc.
                require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
                    winblend = 10,
                    previewer = false,
                }))
            end, { desc = "[/] Fuzzily search in current buffer" }),
        },
    },

    {
        "nvim-telescope/telescope-ui-select.nvim",

        config = function()
            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({}),
                    },
                },
            })
            require("telescope").load_extension("ui-select")
        end,
    },
}

return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },

        config = function()
            require("neo-tree").setup({
                window = {
                    position = "left",
                    width = 40,
                },

                filesystem = {
                    filtered_items = {
                        visible = true,
                        show_hidden_count = true,
                        hide_dotfiles = false,
                        hide_by_name = { ".git" },
                        always_show = { ".env" },
                    },
                },
            })
        end,
    },
}

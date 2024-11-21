return {
    "rmagatti/auto-session",
    config = function()
        require("auto-session").setup({

            suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },

            session_lens = {
                load_on_setup = true, -- Initialize on startup (requires Telescope)
                theme_conf = { -- Pass through for Telescope theme options
                    -- layout_config = { -- As one example, can change width/height of picker
                    --   width = 0.8,    -- percent of window
                    --   height = 0.5,
                    -- },
                },
                previewer = false,
            },

            vim.keymap.set("n", "<leader>ls", require("auto-session.session-lens").search_session, {
                noremap = true,
            }),
        })
    end,
}

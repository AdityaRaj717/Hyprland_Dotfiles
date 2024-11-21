vim.g.mapleader = " "

-- Neo-tree
vim.keymap.set("n", "<leader>e", "<Cmd>Neotree toggle<CR>", { noremap = true, silent = true })

-- Move text up and down
vim.keymap.set({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })

-- Indenting
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")

-- Navigate vim panes better
-- vim.keymap.set("n", "<C-h>", ":wincmd h<CR>")
-- vim.keymap.set("n", "<C-j>", ":wincmd j<CR>")
-- vim.keymap.set("n", "<C-k>", ":wincmd k<CR>")
-- vim.keymap.set("n", "<C-l>", ":wincmd l<CR>")

-- Move lines up and down in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Keep cursor centered in the middle of the screen
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "n", "Nzzzv")

-- Comments
vim.api.nvim_set_keymap("n", "<C-_>", "gcc", { noremap = false })
vim.api.nvim_set_keymap("v", "<C-_>", "gcc", { noremap = false })

-- Split windows
vim.keymap.set("n", "ss", ":vsplit<Return>", { noremap = true, silent = true })
vim.keymap.set("n", "sv", ":split<Return>", { noremap = true, silent = true })

-- Tabs
vim.keymap.set("n", "<leader>te", ":tabedit<Return>", { noremap = true, silent = true })
vim.keymap.set("n", "<tab>", ":tabnext<Return>", { noremap = true, silent = true })
vim.keymap.set("n", "<s-tab>", ":tabprev<Return>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })

-- Search results
vim.keymap.set("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next Search Result" })
vim.keymap.set("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
vim.keymap.set("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
vim.keymap.set("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Prev Search Result" })
vim.keymap.set("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })
vim.keymap.set("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })

-- Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
-- Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
-- Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
-- Snacks.toggle.diagnostics():map("<leader>ud")
-- Snacks.toggle.line_number():map("<leader>ul")
-- Snacks.toggle
--     .option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 })
--     :map("<leader>uc")
-- Snacks.toggle.treesitter():map("<leader>uT")
-- if vim.lsp.inlay_hint then
--     Snacks.toggle.inlay_hints():map("<leader>uh")
-- end

-------------------------
---
---  Telescope
---
-------------------------

-- Telescope buffer explorer
vim.keymap.set(
    "n",
    "<S-h>",
    "<cmd>Telescope buffers sort_mru=true sort_lastused=true initial_mode=normal theme=ivy<cr>",
    { desc = "[P]Open telescope buffers" }
)

vim.keymap.set("n", "<leader>cl", "<cmd>Telescope neoclip <cr>", { desc = "[P]Open telescope neoclip" })

-- APIs

-- Switch Theme
vim.keymap.set("n", "<leader>th", function()
    local options = {
        icon = "", -- optional
        style = "flat", -- optional! compact/flat/bordered
        border = false,
    }
    require("nvchad.themes").open()
end, {})

-- NvChad Terminal
vim.keymap.set("n", "<leader>tt", function()
    require("nvchad.term").new({ pos = "sp", size = 0.3 })
end, {})

vim.keymap.set("n", "<leader>tv", function()
    require("nvchad.term").new({ pos = "vsp", cmd = "neofetch" })
end, {})

vim.keymap.set({ "n", "t" }, "<A-i>", function()
    require("nvchad.term").toggle({ pos = "vsp", id = "floatTerm" })
end)

-- Code Runner

vim.keymap.set({ "n", "t" }, "<leader>tr", function()
    require("nvchad.term").runner({
        id = "boo",
        pos = "sp",

        cmd = function()
            local file = vim.fn.expand("%")

            local ft_cmds = {
                python = "python3 " .. file,
                cpp = "clear && g++ -o out " .. file .. " && ./out",
            }

            return ft_cmds[vim.bo.ft]
        end,
    })
end)

-- Redo last selected option
vim.api.nvim_set_keymap("n", "<F6>", "<cmd>CompilerOpen<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap(
    "n",
    "<S-F6>",
    "<cmd>CompilerStop<cr>" -- (Optional, to dispose all tasks before redo)
    .. "<cmd>CompilerRedo<cr>",
    { noremap = true, silent = true }
)

-- Toggle compiler results
vim.api.nvim_set_keymap("n", "<S-F7>", "<cmd>CompilerToggleResults<cr>", { noremap = true, silent = true })

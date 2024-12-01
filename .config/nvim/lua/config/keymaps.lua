vim.g.mapleader = " "

-- Neo-tree
vim.keymap.set("n", "<leader>e", "<Cmd>Neotree toggle<CR>", { noremap = true, silent = true })

-- Indenting
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")

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
vim.keymap.set("n", "<leader>te", ":tabedit<Return>", { desc = "[T]ab edit" }, { noremap = true, silent = true })
vim.keymap.set("n", "<tab>", ":tabnext<Return>", { desc = "[T]ab next" }, { noremap = true, silent = true })
vim.keymap.set("n", "<s-tab>", ":tabprev<Return>", { desc = "[T]ab prev" }, { noremap = true, silent = true })
vim.keymap.set("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "[T]ab close" })

-- Search results
vim.keymap.set("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next Search Result" })
vim.keymap.set("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
vim.keymap.set("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
vim.keymap.set("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Prev Search Result" })
vim.keymap.set("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })
vim.keymap.set("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })

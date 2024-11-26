-- Appearance
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.scrolloff = 8
vim.opt.completeopt = "menuone,noinsert,noselect"
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"

-- Tabs / Indentation
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.smartindent = true
vim.opt.wrap = false

-- Search
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.hlsearch = false

-- Behavior
vim.opt.hidden = true
vim.opt.errorbells = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.clipboard = "unnamedplus"
vim.opt.iskeyword:append("-")
vim.opt.mouse:append("a")

vim.opt.modifiable = true
vim.opt.encoding = "UTF-8"

-- Change box select and create extra cells for selection, ctrl + v
vim.opt.virtualedit = "block"
vim.g.mapleader = " "
vim.opt.inccommand = "split"

-----------------------------------
-- Misc things
-----------------------------------

-- UFO
vim.o.foldcolumn = "0" -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

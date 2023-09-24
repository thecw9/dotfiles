local opt = vim.opt

vim.g.mapleader = " "

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0

vim.scriptencoding = "utf-8"
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true

opt.smartindent = true
opt.autoindent = true

opt.number = true
opt.relativenumber = false

-- opt.autochdir = true

opt.wrap = true

opt.swapfile = false
opt.backup = false
opt.undofile = true
opt.undodir = vim.fn.stdpath("data") .. "/undodir"

opt.hlsearch = true
opt.incsearch = true

opt.termguicolors = true

opt.scrolloff = 8
opt.signcolumn = "yes"

opt.ignorecase = true

opt.numberwidth = 1
opt.cmdheight = 0

opt.cursorline = true

opt.updatetime = 50

opt.colorcolumn = "80"

-- fold
opt.foldmethod = "indent"
opt.foldlevel = 99
opt.foldenable = true
opt.foldlevelstart = 99

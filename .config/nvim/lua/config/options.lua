-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

local hightlight = vim.api.nvim_set_hl
hightlight(0, "LineNr", { fg = "#aaabab" })
-- hightlight(0, "CursorLineNr", { bg = "#a0b0a0", fg = "#ffffff" })
hightlight(0, "Comment", { fg = "#7faa90" })
-- hightlight(0, "Visual", { bg = "#555577" })
hightlight(0, "MatchParen", { bg = "green" })
-- hightlight(0, "Normal", { bg = "none" })
-- hightlight(0, "NormalFloat", { bg = "none" })
-- hightlight(0, "StatusLine", { bg = "#ff6077", fg = "#000000" })
-- hightlight(0, "Pmenu", { bg = "#504945", fg = "#ebdbb2" })
-- hightlight(0, "PmenuSel", { bg = "#83a598", fg = "#504945" })

opt.termguicolors = true

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
-- opt.foldmethod = "syntax"
opt.foldlevel = 99
opt.foldenable = true
opt.foldlevelstart = 99

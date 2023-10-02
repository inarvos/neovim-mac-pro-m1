vim.g.mapleader = " "
vim.opt.ignorecase = true
vim.opt.smartcase = true

local keymap = vim.keymap -- for conciseness

keymap.set("n", "w", ":call VSCodeNotify('workbench.action.files.save')<cr>")

vim.cmd("autocmd!")

vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

vim.wo.number = true
vim.opt.title = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.cursorline = true
vim.opt.hlsearch = true
vim.opt.backup = false
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 2
vim.opt.expandtab = true
vim.opt.backupskip = { '/tmp/*', '/private/tmp/*' }
vim.opt.inccommand = 'split'
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.wrap = true
vim.opt.whichwrap:append "<>hl"
vim.opt.backspace = { 'start', 'eol', 'indent' }
vim.opt.path:append { '**' } -- Finding files - Search down into subfolders
vim.opt.wildignore:append { '*/node_modules/*' }
vim.opt.splitright = false -- split vertical window to the right
vim.opt.splitbelow = false -- split horizontal window to the bottom
vim.opt.clipboard:append("unnamedplus") -- use system clipboard as default register
-- Undercurl

vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = '*',
  command = "set nopaste"
})

-- Add asterisks in block comments
vim.opt.formatoptions:append { 'r' }

vim.g.mapleader = ","

local Type = {GLOBAL_OPTION = "o", WINDOW_OPTION = "wo", BUFFER_OPTION = "bo"}
local add_options = function(option_type, options)
  if type(options) ~= "table" then
    error 'options should be a type of "table"'
    return
  end
  local vim_option = vim[option_type]
  for key, value in pairs(options) do
    vim_option[key] = value
  end
end
local Option = {}
Option.g = function(options)
  add_options(Type.GLOBAL_OPTION, options)
end

Option.g {
  virtualedit = "onemore",
}

-- Highlights

vim.opt.termguicolors = true
vim.opt.background = 'dark'
vim.opt.signcolumn = 'yes'
vim.opt.winblend = 0
vim.opt.wildoptions = 'pum'
vim.opt.pumblend = 5

--highlight yanked text for 200ms using the "Visual" highlight group
vim.cmd [[
  augroup highlight_yank
  autocmd!
  au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Visual", timeout=100})
  augroup END
]]

-- Colorscheme

local status, _ = pcall(vim.cmd, 'colorscheme moonfly')
if not status then
  print('Colorscheme not found!')
  return
end

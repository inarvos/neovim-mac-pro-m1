-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

keymap.set("n", "<leader>vs", ":call vimspector#Launch()<CR>") -- vimspector

keymap.set('', 'm', 'gM')

-- go to line ending: $, beginning: 0, first character: _
-- line middle:
keymap.set('', 'm', 'gM')

-- next word: W

-- use hash
keymap.set('', '<opt>3', '#')

-- delete single character without copying into register
keymap.set('n', 'x', '"_x')

-- quit
keymap.set('n', 'q', ':q<cr>')
keymap.set('n', '<leader>qa', ':qa<cr>')
keymap.set('n', 'w', ':w<cr>')

-- open terminal
keymap.set("n", "<leader>tr", ":terminal<Return>")
-- exit insert mode in terminal
keymap.set('t', '<ESC>', [[<C-\><C-n>]], { noremap = true })

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<cr>")

-- Increment/decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')
-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>") -- increment
keymap.set("n", "<leader>-", "<C-x>") -- decrement

-- Delete a word backwards
keymap.set('n', 'dw', 'vb"_d')

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- Save with root permission (not working for now)
--vim.api.nvim_create_user_command('W', 'w !sudo tee > /dev/null %', {})

-- Window management
keymap.set('n', 'ss', ':split<Return>') -- split window vertically
keymap.set('n', 'sv', ':vsplit<Return><C-w>w') -- split window vertically
keymap.set("n", "se", "<C-w>=") -- make split windows equal width & height
keymap.set("n", "sx", ":close<CR>") -- close current split window
-- Move window
keymap.set('n', '<Space>', '<C-w>w')

-- Move between windows
keymap.set('', '<leader><up>', '<C-w><up>')
keymap.set('', '<leader><down>', '<C-w><down>')
keymap.set('', '<leader><left>', '<C-w><left>')
keymap.set('', '<leader><right>', '<C-w><right>')

-- Vimspector
-- keymap.set("n", "<leader>vs", ":call vimspector#Launch()<CR>") -- vimspector
-- keymap.set("n", "<leader>vsc", ":call vimspector#Continue()<CR>") -- vimspector continue
-- keymap.set("n", "<leader>vsn", ":call vimspector#StepOver()<CR>") -- vimspector step over
-- keymap.set("n", "<leader>vssi", ":call vimspector#StepInto()<CR>") -- vimspector step into
-- keymap.set("n", "<leader>vsso", ":call vimspector#StepOut()<CR>") -- vimspector step out
-- keymap.set("n", "<leader>vss", ":call vimspector#Stop()<CR>") -- vimspector stop
-- keymap.set("n", "<leader>vsr", ":call vimspector#Restart()<CR>") -- vimspector restart
-- keymap.set("n", "<leader>vsp", ":call vimspector#Pause()<CR>") -- vimspector pause
-- keymap.set("n", "<leader>vslb", ":call vimspector#ListBreakpoints()<CR>") -- vimspector show/hide the breakpoints window
-- keymap.set("n", "<leader>vsb", ":call vimspector#ToggleBreakpoint()<CR>") -- vimspector create breakpoint
-- keymap.set("n", "<leader>vsnb", ":call vimspector#JumpToNextBreakpoint()<CR>") -- vimspector move cursor to the next breakpoint in current file
-- keymap.set("n", "<leader>vspb", ":call vimspector#JumpToPreviousBreakpoint()<CR>") -- vimspector move cursor to the previous breakpoint in current file
-- keymap.set("n", "<leader>vscb", ":call vimspector#ToggleBreakpoint( { trigger expr, hit count expr } )<CR>") -- vimspector create conditional breakpoint or logpoint on the current line
-- keymap.set("n", "<leader>vsfb", ":call vimspector#AddFunctionBreakpoint( '<cexpr>' )<CR>") -- vimspector create function breakpoint for the expression under cursor
-- keymap.set("n", "<leader>vsjtpc", ":call vimspector#JumpToProgramCounter()<CR>") -- vimspector move cursor to the program counter in the current frame
-- keymap.set("n", "<leader>vsres", ":call vimspector#Reset()<CR>") -- vimspector reset
-- keymap.set("n", "<leader>vsq", ":call vimspector#Reset()<CR>") -- vimspector reset
-- keymap.set("n", "<leader>vse", ":call vimspector#Reset()<CR>") -- vimspector reset
-- keymap.set("n", "<leader>vsgtcl", ":call vimspector#GoToCurrentLine()<CR>") -- vimspector reset the current program counter to the current line
-- keymap.set("n", "<leader>vsrtc", ":call vimspector#RunToCursor()<CR>") -- vimspector run to cursor
-- keymap.set("n", "<leader>vssd", ":call vimspector#ShowDisassembly()<CR>") -- vimspector show disassembly, enable instruction stepping
-- keymap.set("n", "<leader>vsuf", ":call vimspector#UpFrame()<CR>") -- vimspector move up a frame in the current call stack
-- keymap.set("n", "<leader>vsdf", ":call vimspector#DownFrame()<CR>") -- vimspector move down a frame in the current call stack

-- Tabs
keymap.set('n', 'te', ':tabedit<Return>') -- edit new tab
keymap.set("n", "to", ":tabnew<CR>") -- open new tab
keymap.set("n", "tc", ":tabclose<CR>") -- close current tab
keymap.set("n", "tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "tn", ":tabn<CR>") --  go to next tab
keymap.set("n", "<tab>", ":tabn<CR>") --  go to next tab
keymap.set("n", "tp", ":tabp<CR>") --  go to previous tab

----------------------
-- Plugin Keybinds
----------------------

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- toggle split window maximization

-- nvim-tree
keymap.set("n", "<leader>nt", ":NvimTreeToggle<CR>") -- toggle file explorer
keymap.set("n", "<leader>neo", ":Neotree<CR>") -- toggle Neotree file explorer
keymap.set("n", "<leader>nerd", ":NERDTree<CR>") -- toggle Neotree file explorer

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags

-- telescope git commands (not on youtube nvim video)
keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>") -- list all git commits (use <cr> to checkout) ["gc" for git commits]
keymap.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>") -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>") -- list git branches (use <cr> to checkout) ["gb" for git branch]
keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>") -- list current changes per file with diff preview ["gs" for git status]

keymap.set("", "<leader>tt", ":TagbarToggle<CR>") -- view file structure

-- restart lsp server (not on youtube nvim video)
keymap.set("n", "<leader>rs", ":LspRestart<CR>") -- mapping to restart lsp if necessary

--Close buffers
keymap.set('n', '<Leader>b',
  function()
    local curbufnr = vim.api.nvim_get_current_buf()
    local buflist = vim.api.nvim_list_bufs()
    for _, bufnr in ipairs(buflist) do
      if vim.bo[bufnr].buflisted and bufnr ~= curbufnr and (vim.fn.getbufvar(bufnr, 'bufpersist') ~= 1) then
        vim.cmd('bd ' .. tostring(bufnr))
      end
    end
  end, { silent = true, desc = 'Close unused buffers' })

--Comments: 'gcc' and 'gc' in visual mode

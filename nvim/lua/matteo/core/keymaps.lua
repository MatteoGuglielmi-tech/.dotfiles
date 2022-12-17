-- Modes:
-- NORMAL = "n",
-- INSERT = "i",
-- VISUAL = "v",
-- VISUAL_BLOCK = "x",
-- COMMAND = "c",
-- shift button = 'S',
-- cmd button (mac) = "D",
-- ctrl button = "C"
-- carriage return = Enter = "CR"

-- to configure keymaps
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Set leader key as space
vim.g.mapleader = " "

---------------------
-- General Keymaps
---------------------

-- Source current file
map("n", "<leader><CR>", "<cmd>source %<CR>", opts)
-- Rename word under the cursor with find and replace
map("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

-- "jk" equivalent to ESC in insert mode
map("i", "jk", "<ESC>", opts)

-- increment and decrement numbers in normal mode
map("n", "<leader>+", "<C-a>")
map("n", "<leader>-", "<C-x>")

-- clear search highlights
map("n", "<leader>nh", ":nohl<CR>")

-- Window splitting
map("n", "<leader>sv", "<C-w>v", opts) --  vertical split
map("n", "<leader>so", "<C-w>s", opts) -- horizontal split
map("n", "<leader>se", "<C-w>=", opts) -- make split windows equal width & height
map("n", "<leader>sx", ":close<CR>", opts) -- close current split window

-- Window navigation
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Window resizing
map("n", "<C-S>a", "<cmd>resize -2<CR>", opts)
map("n", "<C-S>d", "<cmd>resize +2<CR>", opts)
map("n", "<C-S>s", "<cmd>vertical resize -2<CR>", opts)
map("n", "<C-S>w", "<cmd>vertical resize +2<CR>", opts)

-- Window creation
map("n", "<leader>to", ":tabnew<CR>") -- open new tab
map("n", "<leader>tx", ":tabclose<CR>") -- close current tab
map("n", "<leader>tn", ":tabn<CR>") --  go to next tab
map("n", "<leader>tp", ":tabp<CR>") --  go to previous tab

-- Toggle between two files
map("n", "<C-ì>", "<C-6>", opts)

-- Stay in indent mode
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- Move lines up and down
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- Copy selected text to system clipboard
map("v", "<leader>y", '"+y', opts)
-- Replace selected text without yanking
map("v", "<leader>p", '"_dP', opts)
-- Delete selected text without yanking
map("v", "<leader>d", '"-d"', opts)

----------------------
-- Plugin Keybinds
----------------------

-- vim-maximizer : toggle split window maximizer
map("n", "<leader>sm", ":MaximizerToggle<CR>")

-- nvim-tree : toggle file explorer
map("n", "<leader>e", ":NvimTreeToggle<CR>")

-- telescope
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
map("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
map("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags

-- telescope git commands
map("n", "<leader>gc", "<cmd>Telescope git_commits<cr>") -- list all git commits (use <cr> to checkout) ["gc" for git commits]
map("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>") -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
map("n", "<leader>gb", "<cmd>Telescope git_branches<cr>") -- list git branches (use <cr> to checkout) ["gb" for git branch]
map("n", "<leader>gs", "<cmd>Telescope git_status<cr>") -- list current changes per file with diff preview ["gs" for git status]

-- restart lsp server
map("n", "<leader>rs", ":LspRestart<CR>") -- mapping to restart lsp if necessary

-- navigate buffers
map("n", "<S-l>", ":bnext<CR>", opts)
map("n", "<S-h>", ":bprevious<CR>", opts)

map("n", "<leader>c", ":Bdelete<CR>", opts)

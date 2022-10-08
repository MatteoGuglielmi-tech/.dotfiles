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

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Set leader key
vim.g.mapleader = " "

-- Source current file
map("n", "<leader><CR>", "<cmd>source %<CR>", opts)
-- Rename word under the cursor with find and replace
map("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

map("i", "jk", "<ESC>", opts)

-- Window splitting
map("n", "<leader>sv", "<C-w>v", opts)
map("n", "<leader>so", "<C-w>s", opts)

-- Window navigation
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Window resizing
map("n", "<C-S-Up>", "<cmd>resize -2<CR>", opts)
map("n", "<C-S-Down>", "<cmd>resize +2<CR>", opts)
map("n", "<C-S-Left>", "<cmd>vertical resize -2<CR>", opts)
map("n", "<C-S-Right>", "<cmd>vertical resize +2<CR>", opts)

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

-- cursor options
vim.opt.cursorline = true
vim.opt.guicursor = ""
vim.opt.termguicolors = true
--vim.opt.background = "dark"
--vim.opt.signcolumn = "yes"

-- tab spaces and indentation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true

-- relative line numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.incsearch = true
vim.opt.hlsearch = false

vim.opt.laststatus = 3
-- removed nnoying column limit
-- vim.opt.colorcolumn = "80"
vim.opt.scrolloff = 10
vim.opt.pumheight = 10

-- wrapping
vim.opt.hidden = true
vim.opt.swapfile = false
-- prevent code from wrapping. Do it manually
vim.opt.wrap = false

vim.opt.foldmethod = "manual"
vim.opt.foldenable = false
vim.opt.foldlevel = 99

vim.cmd([[
  au BufWinLeave * silent! mkview!
  au BufWinEnter * silent! loadview
  ]])

-- search settings
-- if searching lower case matches all occurences (also upper cased)
-- if searching with upper case letter, matched only upper cased occurences
vim.opt.ignorecase = true
vim.opt.smartcase = true

--backspace to make it work properly
vim.opt.backspace = "indent,eol,start"

-- clipboard : forces nvim to use whatever is in the copy buffer of the system
vim.opt.clipboard:append("unnamedplus")

-- split windows
vim.opt.splitright = true
vim.opt.splitbelow = true

-- to consider - as part of word
vim.opt.iskeyword:append("-")

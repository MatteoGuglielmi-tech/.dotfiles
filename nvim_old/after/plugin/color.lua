vim.g.tokyonight_style = 'night'
vim.g.tokyonight_transparent = true
vim.g.tokyonight_transparent_sidebar = true
vim.g.tokyonight_italic_comments = false
vim.g.tokyonight_italic_keywords = false
vim.g.tokyonight_italic_functions = false
vim.g.tokyonight_italic_variables = false
vim.g.tokyonight_colors = {bg_float = 'none'}

vim.cmd("colorscheme tokyonight")

vim.api.nvim_set_hl(0, 'Pmenu', {bg = 'none'})

vim.opt.background = 'dark'

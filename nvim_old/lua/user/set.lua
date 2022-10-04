local sets = {
    guicursor = "",

    tabstop = 4,
    softtabstop = 4,
    shiftwidth = 4,
    expandtab = true,

    number = true,
    relativenumber = true,
    incsearch = true,
    hlsearch = false,

    smartindent = true,
    autoindent = true,

    ignorecase = true,
    smartcase = true,

    -- https://neovim.io/doc/user/options.html
    signcolumn = "auto", -- where and when display column
    colorcolumn = "80", -- column to be highlighted (may be a list)
    pumheight = 10, -- max number of items to show in pop up menus
    laststatus = 3, 
    scrolloff = 20, -- min number of screen lines to keep above/under cursoro
    
    
    -- when selecting with mouse enter Select mode
    mouse = "a",


    hidden = true,

    -- swap buffer
    swapfile = false,

    -- no broken lines if length > max_length
    wrap = false,

    -- splitting windows settings
    splitbelow = true,
    splitright = true,

}

for k, v in pairs(sets) do
    vim.opt[k] = v
end

vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
vim.g.netrw_browse_split = 4
vim.g.netrw_altv = 1
vim.g.netrw_winsize = 25

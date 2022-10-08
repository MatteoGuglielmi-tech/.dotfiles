local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
    -- My plugins here
    use 'wbthomason/packer.nvim'
    -- Colorscheme
    use 'folke/tokyonight.nvim'
    -- Fuzzy finder and dependencies
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'
    use 'nvim-telescope/telescope-fzy-native.nvim'
    -- Treesitter
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    -- Completion plugin and dependencies
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-buffer' -- completion buffer
    use 'hrsh7th/cmp-path'  -- path completion
    use 'hrsh7th/cmp-cmdline' -- cmd line completion
    use 'onsails/lspkind-nvim'
    -- Snippet engine and dependencies
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'
    use 'rafamadriz/friendly-snippets'
    -- Lsp related plugins
    use 'hrsh7th/cmp-nvim-lsp'
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'
    use 'ray-x/lsp_signature.nvim'
    -- Surround text faster
    use 'tpope/vim-surround'
    -- Comments plugin
    use 'tpope/vim-commentary'
    -- Git wrappers
    use 'tpope/vim-fugitive'
    use {'lewis6991/gitsigns.nvim', tag = 'release'}
    -- Automatically create pairs
    use 'windwp/nvim-autopairs'
    -- Status line
    use 'nvim-lualine/lualine.nvim'

    -- tabnine
    use {'tzachar/cmp-tabnine', run='./install.sh', requires = 'hrsh7th/nvim-cmp'}
    use 'onsails/lspkind-nvim'

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)

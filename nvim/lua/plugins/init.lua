local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function()
    use { "wbthomason/packer.nvim" }
    --use { "folke/tokyonight.nvim" }
    use { "Mofiqul/dracula.nvim" }
    use { "kyazdani42/nvim-web-devicons" }
    use {
        "nvim-treesitter/nvim-treesitter",
        run = function()
            require("nvim-treesitter.install").update({ with_sync = true })
        end,
        config = function()
            require("plugins.configs.treesitter")
        end,
    }
    use {
        "nvim-treesitter/nvim-treesitter-context",
        config = function()
            require("treesitter-context").setup()
        end,
    }
    use {
        "nvim-telescope/telescope.nvim",
        requires = { { "nvim-lua/plenary.nvim" } },
        config = function()
            require("plugins.configs.telescope")
        end
    }
    use {
        "nvim-telescope/telescope-fzf-native.nvim",
        run = "make"
    }
    use {
        "neovim/nvim-lspconfig",
        config = function()
            require("plugins.configs.lspconfig")
        end,
    }
    use {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup({
                ui = { border = { '┌', '─', '┐', '│', '┘', '─', '└', '│' } }
            })
        end,
    }
    use {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup()
        end,
    }
    use { "onsails/lspkind.nvim" }
    use {
        "hrsh7th/nvim-cmp",
        config = function()
            require("plugins.configs.cmp")
        end,
    }
    use { "hrsh7th/cmp-buffer" }
    use { "hrsh7th/cmp-path" }
    use { "hrsh7th/cmp-cmdline" }
    use { "hrsh7th/cmp-nvim-lsp" }
    use {
        "L3MON4D3/LuaSnip",
        config = function()
            require("plugins.configs.luasnip")
        end
    }
    use { "saadparwaiz1/cmp_luasnip" }
    use { "rafamadriz/friendly-snippets" }
    use {
        "kylechui/nvim-surround",
        config = function()
            require("nvim-surround").setup()
        end
    }
    use {
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end
    }
    use {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup()
        end
    }
    --use {
    --    "mg979/vim-visual-multi",
    --    config = function ()
    --        require('vim-visual-multi').setup()
    --    end
    --}
    if packer_bootstrap then
        require("packer").sync()
    end
end)


-- auto install packer if not installed
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

-- import packer safely
local status, packer = pcall(require, "packer")
if not status then
	return
end

return packer.startup(function(use)
	-- packer can manage itself
	use({ "wbthomason/packer.nvim" })

	-- lua functions that many plugins use
	use({ "nvim-lua/plenary.nvim" })

	--preferred colorscheme
	--use { "bluz71/vim-nightfly-colors" }
	--use { "folke/tokyonight.nvim" }
	use({ "Mofiqul/dracula.nvim" })

	-- tmux & split window navigation
	-- allows to use ctr + h, j, k, l to navigate between splits
	use({ "christoomey/vim-tmux-navigator" })

	-- allows to maximize and restores current window
	use({ "szw/vim-maximizer" })

	-- essential plugins
	-- add, delete, change surroundings
	-- usage : suppose we want to surround a variable with a char "c"
	-- ys<motion>c
	-- in this case yswc for word wrapping
	-- to delete : ds"
	-- to change surrounding char : cs"<target char>
	use({ "tpope/vim-surround" })

	-- replace with register contents using motion
	-- usage :
	-- copy sth with yank,
	-- jump where you want
	-- gr + motion
	use({ "inkarkat/vim-ReplaceWithRegister" })

	-- commenting with gc
	-- gcc to comment one line
	-- gc9j to comment up to line 9 from current one
	use({ "numToStr/Comment.nvim" })

	-- file explorer
	-- to create a new file in the explorer, just type A
	use({ "nvim-tree/nvim-tree.lua" })

	-- vs-code like icons
	use({ "nvim-tree/nvim-web-devicons" })

	-- statusline : to have a fancy line status at the bottom
	use({ "nvim-lualine/lualine.nvim" })

	-- IDE tabs like
	use({ "akinsho/bufferline.nvim", tag = "v3.*", requires = "nvim-tree/nvim-web-devicons" })

	-- to delete buffers without closing the window
	use({ "moll/vim-bbye" })
	-- fuzzy finding telescope
	-- dependency for better sorting performance
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	-- fuzzy finder itself
	use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" })

	-- autocompletion
	use({ "hrsh7th/nvim-cmp" }) -- completion plugin
	use({ "hrsh7th/cmp-buffer" }) -- source for text in buffer
	use({ "hrsh7th/cmp-path" }) -- source for file system paths

	-- snippets
	use({ "L3MON4D3/LuaSnip" }) -- snippet engine
	use({ "saadparwaiz1/cmp_luasnip" }) -- for autocompletion
	use({ "rafamadriz/friendly-snippets" }) -- useful snippets

	-- managing & installing lsp servers, linters & formatters
	use({ "williamboman/mason.nvim" }) -- in charge of managing lsp servers, linters & formatters
	use({ "williamboman/mason-lspconfig.nvim" }) -- bridges gap b/w mason & lspconfig

	-- configuring lsp servers
	use({ "neovim/nvim-lspconfig" }) -- easily configure language servers
	use({ "hrsh7th/cmp-nvim-lsp" }) -- for autocompletion
	use({ "glepnir/lspsaga.nvim", branch = "main" }) -- enhanced lsp uis
	-- use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript server (e.g. rename file & update imports)
	use({ "onsails/lspkind.nvim" }) -- vs-code like icons for autocompletion

	-- formatting & linting
	use({ "jose-elias-alvarez/null-ls.nvim" }) -- configure formatters & linters
	use({ "jayp0521/mason-null-ls.nvim" }) -- bridges gap b/w mason & null-ls

	-- treesitter configuration
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})

	-- use nvim-ts-rainbow for rainbow parentheses
	use({ "p00f/nvim-ts-rainbow" })

	-- auto closing
	use({ "windwp/nvim-autopairs" }) -- autoclose parens, brackets, quotes, etc...
	use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags

	-- toggleterm to toggle terminal while being in neovim window
	use({ "akinsho/toggleterm.nvim" })

	-- git integration
	use({ "lewis6991/gitsigns.nvim" }) -- show line modifications on left hand side

	-- use indentLine package to show indentation
	use({ "lukas-reineke/indent-blankline.nvim" })

	-- use alpha to have a better experience with nvim
	use({
		"goolord/alpha-nvim",
		config = function()
			require("alpha").setup(require("alpha.themes.dashboard").config)
		end,
	})

	use({ "ahmedkhalf/project.nvim" })
	-- to speedup startup time
	use({ "lewis6991/impatient.nvim" })
	-- use which-key to have keybindings popup_mappings
	use({ "folke/which-key.nvim" })

	-- use copilot from github
	use({ "github/copilot.vim" })

	if packer_bootstrap then
		require("packer").sync()
	end
end)

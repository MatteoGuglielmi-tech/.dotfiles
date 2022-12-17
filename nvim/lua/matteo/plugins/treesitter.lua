-- import nvim-treesitter plugin safely
local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
	return
end

-- configure treesitter
treesitter.setup({
	-- enable syntax highlighting
	highlight = {
		enable = true,
	},
	-- enable indentation
	indent = { enable = true },
	-- enable autotagging (w/ nvim-ts-autotag plugin)
	autotag = { enable = true },
	-- ensure these language parsers are installed
	ensure_installed = {
		"json",
		"bash",
		"lua",
		"vim",
		"python",
		"c",
		"cpp",
	},
	-- auto install above language parsers
	auto_install = true,
	rainbow = {
		enable = true,
		extended_mode = true,
		max_file_lines = nil,
	},
	autopairs = { enable = true },
})

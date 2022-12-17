local status, lualine = pcall(require, "lualine")
if not status then
	return
end

-- get lualine dracula theme
local lualine_dracula = require("lualine.themes.dracula")

-- new colors for theme
local new_colors = {
	blue = "#65D1FF",
	green = "#3EFFDC",
	violet = "#FF61EF",
	yellow = "#FFDA7B",
	black = "#000000",
}

-- change dracula theme colors
lualine_dracula.normal.a.bg = new_colors.blue -- normal mode in blue
lualine_dracula.insert.a.bg = new_colors.green -- insert mode in green
lualine_dracula.visual.a.bg = new_colors.violet -- visual mode in violet
lualine_dracula.command = { -- command mode
	a = {
		gui = "bold",
		bg = new_colors.yellow,
		fg = new_colors.black, -- black
	},
}

local hide_in_width = function()
	return vim.fn.winwidth(0) > 80
end

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = { "error", "warn" },
	symbols = { error = " ", warn = " " },
	colored = false,
	always_visible = true,
}

local diff = {
	"diff",
	colored = false,
	symbols = { added = "", modified = "", removed = "" }, -- changes diff symbols
	cond = hide_in_width,
}

local mode = {
	"mode",
	fmt = function(str)
		return "-- " .. str .. " --"
	end,
}
local branch = {
	"branch",
	icons_enabled = true,
	icon = "",
}

-- configure lualine with modified theme
lualine.setup({
	options = {
		incons_enable = true,
		theme = lualine_dracula,
	},
	sections = {
		lualine_a = { branch, diagnostics },
		lualine_b = { mode },
		lualine_c = { diff },
	},
})

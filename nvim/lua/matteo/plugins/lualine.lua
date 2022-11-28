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
lualine_dracula.normal.a.bg = new_colors.blue   -- normal mode in blue
lualine_dracula.insert.a.bg = new_colors.green  -- insert mode in green
lualine_dracula.visual.a.bg = new_colors.violet -- visual mode in violet
lualine_dracula.command = { -- command mode
  a = {
    gui = "bold",
    bg = new_colors.yellow,
    fg = new_colors.black, -- black
  },
}

-- configure lualine with modified theme
lualine.setup({
  options = {
    theme = lualine_dracula,
  },
})

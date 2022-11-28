local map = vim.keymap.set
local opts = { noremap = true, silent = true }
local luasnip = require("luasnip")
require("luasnip.loaders.from_vscode").lazy_load()

map({ "i", "s" }, "<c-k>", function()
    if luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
    end
end, opts)

map({ "i", "s" }, "<c-j>", function()
    if luasnip.jumpable(-1) then
        luasnip.jump(-1)
    end
end, opts)

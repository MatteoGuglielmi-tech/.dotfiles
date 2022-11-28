-- import mason plugin safely
local mason_status, mason = pcall(require, "mason")
if not mason_status then
  return
end

-- import mason-lspconfig plugin safely
local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
  return
end

-- import mason-null-ls plugin safely
local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status then
  return
end

-- enable mason
mason.setup()

-- https://github.com/williamboman/mason-lspconfig.nvim
mason_lspconfig.setup({
  -- list of servers for mason to install
  ensure_installed = {
    "sumneko_lua",
    "clangd",
    "ltex",
    "texlab",
    "marksman",
    "prosemd_lsp",
    "remark_ls",
    "zk",
    "jedi_language_server",
    "pyright",
    "sourcery",
    "pylsp",
    "esbonio",  -- sphinx
    "bashls"
  },
  -- auto-install configured servers (with lspconfig)
  automatic_installation = true, -- not the same as ensure_installed
})

mason_null_ls.setup({
  -- list of formatters & linters for mason to install
  ensure_installed = {
    "gitlint",          -- git linter
    "stylua",           -- lua formatter
    "cpplint",          -- c/cpp
    "clang_format",     -- c cpp cs java cuda
    "autopep8",         -- python
    "black",
    "blue",
    "flake8",
    "isort",
    "mypy",
    "pylint",
    "vulture",
    "yapf",
    "shellcheck",       -- bash
    "shellharden",
    "shfmt"
  },
  -- auto-install configured formatters & linters (with null-ls)
  automatic_installation = true,
})

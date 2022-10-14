-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local options = { noremap = true, silent = true }
vim.keymap.set("n", "gl", vim.diagnostic.open_float, options)
vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, options)
vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, options)

vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = false,
})

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
    vim.keymap.set("n", "<C-O>", vim.lsp.buf.definition, bufopts)
    vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set("n", "gI", vim.lsp.buf.implementation, bufopts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
    vim.keymap.set("n", "gl", vim.diagnostic.open_float, bufopts) -- show siagnostic on a floating window
    vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
    vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, bufopts)
    vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, bufopts)
end

local border = {
    { '┌', "FloatBorder" },
    { '─', "FloatBorder" },
    { '┐', "FloatBorder" },
    { '│', "FloatBorder" },
    { '┘', "FloatBorder" },
    { '─', "FloatBorder" },
    { '└', "FloatBorder" },
    { '│', "FloatBorder" },
}

local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
    opts = opts or {}
    opts.border = opts.border or border
    return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

-- Set up lspconfig for autocompletion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

-- Initialize language servers
require("lspconfig")["sumneko_lua"].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" }
            }
        }
    }
}

require("lspconfig")["pylsp"].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          ignore = {
              'W191',
              'W293',
              'E222',
              'E231',
              'E302',
              'E501',
          },
        }
      }
    }
  }
}


require("lspconfig")["clangd"].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" }
            }
        }
    }
}


require("lspconfig")["bashls"].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" }
            }
        }
    }
}


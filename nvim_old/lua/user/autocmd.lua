-- Sync (update/install missing) plugins whenever plugins.lua is saved
local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd(
    'BufWritePost',
    {
        command = 'source <afile> | PackerSync',
        group = packer_group,
        pattern = 'packer.lua'
    }
)
-- autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync(nil, 100)

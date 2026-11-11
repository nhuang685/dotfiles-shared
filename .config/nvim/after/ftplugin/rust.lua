local bufnr = vim.api.nvim_get_current_buf()
local map = function(keys, func, desc, mode)
    mode = mode or 'n'
    vim.keymap.set(mode, keys, func, { silent = true, buffer = bufnr, desc = 'Rust LSP: ' .. desc })
end
map('gra', function()
    vim.cmd.RustLsp 'codeAction' -- supports rust-analyzer's grouping
    -- or vim.lsp.buf.codeAction() if you don't want grouping.
end, '[G]oto Code [A]ction', { 'n', 'x' })
map(
    'K', -- Override Neovim's built-in hover keymap with rustaceanvim's hover actions
    function() vim.cmd.RustLsp { 'hover', 'actions' } end,
    'Hover'
)

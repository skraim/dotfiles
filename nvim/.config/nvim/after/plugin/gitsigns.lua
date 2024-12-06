require('gitsigns').setup({
    on_attach = function(bufnr)
        local function map(mode, lhs, rhs, opts)
            opts = vim.tbl_extend('force', { noremap = true, silent = true }, opts or {})
            vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts)
        end

        map('n', '<leader>hs', ':Gitsigns stage_hunk<CR>')
        map('v', '<leader>hs', ':Gitsigns stage_hunk<CR>')
        map('n', '<leader>hr', ':Gitsigns reset_hunk<CR>')
        map('v', '<leader>hr', ':Gitsigns reset_hunk<CR>')
        map('n', '<leader>hu', '<cmd>Gitsigns undo_stage_hunk<CR>')
        map('n', '<leader>hp', '<cmd>Gitsigns preview_hunk<CR>')
        map('n', '<leader>hd', '<cmd>Gitsigns diffthis<CR>')
    end
})

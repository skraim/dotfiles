local telescope = require('telescope')

telescope.setup {
    pickers = {
        find_files = {
            hidden = true
        },
        git_files = {
            hidden = true
        }
    },
    defaults = {
        vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--hidden",
        }
    }
}

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
vim.keymap.set("n", "<C-p>", builtin.git_files, {})
vim.keymap.set("n", "<leader>ps", function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
-- vim.keymap.set("v", "<leader>ps", function()

-- -- vim.api.nvim_set_keymap('v', '<leader>g', [[:<C-u>lua require('telescope.builtin').grep_string({ search = vim.fn.expand('<cword>') })<CR>]], { noremap = true, silent = true })
--     builtin.grep_string({ search = vim.fn.getreg('"') });
-- end)

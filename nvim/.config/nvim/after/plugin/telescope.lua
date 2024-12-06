local telescope = require('telescope')
local builtin = require("telescope.builtin")

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

vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
vim.keymap.set("n", "<C-p>", builtin.git_files, {})
vim.keymap.set("n", "<leader>ps", function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)


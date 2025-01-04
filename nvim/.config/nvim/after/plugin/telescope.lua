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
    },
    extensions = {
        ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
        },
    },
}

pcall(require('telescope').load_extension, 'fzf')
pcall(require('telescope').load_extension, 'ui-select')

function vim.getVisualSelection()
	vim.cmd('noau normal! "vy"')
	local text = vim.fn.getreg('v')
	vim.fn.setreg('v', {})

	text = string.gsub(text, "\n", "")
	if #text > 0 then
		return text
	else
		return ''
	end
end

vim.keymap.set("n", "<leader>sf", builtin.find_files, {})
vim.keymap.set("n", "<leader>sg", builtin.git_files, {})
vim.keymap.set('n', '<leader>so', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set("n", "<leader>st", function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

vim.keymap.set('v', '<space>st', function()
	local text = vim.getVisualSelection()
	builtin.grep_string({ search = text })
end, { noremap = true, silent = true })

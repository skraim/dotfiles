local function read_state_file()
    local file = io.open(os.getenv("HOME") .. "/scripts/force_qwerty_state", "r")
    if not file then
        return nil
    end
    local content = file:read("*a")
    file:close()
    return content
end

local force_qwerty = read_state_file()

if force_qwerty then
    force_qwerty = tonumber(force_qwerty:match("%d+"))
else
    force_qwerty = 0
end

vim.g.mapleader = " "

vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

vim.keymap.set('x', '<leader>p', '"_dP')

vim.keymap.set('n', '<leader>y', '"+y')
vim.keymap.set('v', '<leader>y', '"+y')
vim.keymap.set('n', '<leader>Y', '"+Y')
vim.keymap.set('n', '<leader>p', '"+p')

vim.keymap.set("n", "<C-p>", vim.cmd.cp)
vim.keymap.set("n", "<C-n>", vim.cmd.cn)

if force_qwerty == 1 then
    vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
    vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

    vim.keymap.set('n', 'J', 'mzJ`z')

    vim.keymap.set('n', 'n', 'nzzzv')
    vim.keymap.set('n', 'N', 'Nzzzv')
else
    vim.keymap.set({"n", "v", "o"}, "n", "j");
    vim.keymap.set({"o"}, "N", "J");

    vim.keymap.set({"n", "v", "o"}, "e", "k");
    vim.keymap.set({"n", "o"}, "E", "K");

    vim.keymap.set({"n", "v", "o"}, "m", "h");
    vim.keymap.set({"n", "v", "o"}, "M", "H");

    vim.keymap.set({"n", "v", "o"}, "i", "l");
    vim.keymap.set({"n", "v", "o"}, "I", "L");

    vim.keymap.set({"v", "o"}, "j", "n");
    vim.keymap.set({"v", "o"}, "J", "N");

    vim.keymap.set({"n", "v", "o"}, "k", "e");
    vim.keymap.set({"n", "v", "o"}, "K", "E");

    vim.keymap.set({"n", "v", "o"}, "h", "m");
    vim.keymap.set({"n", "v", "o"}, "H", "M");

    vim.keymap.set({"n", "v", "o"}, "l", "i");
    vim.keymap.set({"n", "v", "o"}, "L", "I");

    vim.keymap.set('v', 'N', ":m '>+1<CR>gv=gv")
    vim.keymap.set('v', 'E', ":m '<-2<CR>gv=gv")

    vim.keymap.set('n', 'N', 'mzJ`z')

    vim.keymap.set('n', 'j', 'nzzzv')
    vim.keymap.set('n', 'J', 'Nzzzv')

    vim.keymap.set("n", "<C-W>m", "<C-W>h")
    vim.keymap.set("n", "<C-W>n", "<C-W>j")
    vim.keymap.set("n", "<C-W>e", "<C-W>k")
    vim.keymap.set("n", "<C-W>i", "<C-W>l")
end

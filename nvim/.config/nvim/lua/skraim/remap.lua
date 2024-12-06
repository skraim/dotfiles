local function read_state_file()
    local file = io.open(os.getenv("HOME") .. "/states", "r")
    if not file then
        return nil
    end
    local content = file:read("*a")
    file:close()

    local kb_layout = content:match('KB_LAYOUT="(.-)"')
    return kb_layout
end

local kb_layout = read_state_file()

if not kb_layout then
    kb_layout = 'qwerty'
end

vim.g.mapleader = " "

vim.keymap.set("n", "<Esc>", "<cmd>noh<CR>")
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

vim.keymap.set('v', '<leader>p', '"_dP')

vim.keymap.set('n', '<leader>p', '"+p')

vim.keymap.set("n", "<C-p>", vim.cmd.cp)
vim.keymap.set("n", "<C-n>", vim.cmd.cn)

if kb_layout == 'qwerty' then
    vim.keymap.set({ 'n', 'v'}, '<leader>y', '"+y')
    vim.keymap.set('n', '<leader>Y', '"+Y')

    vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
    vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

    vim.keymap.set('n', 'J', 'mzJ`z')

    vim.keymap.set('n', 'n', 'nzzzv')
    vim.keymap.set('n', 'N', 'Nzzzv')
end

if kb_layout == 'colemak' then
    vim.keymap.set({ 'n', 'v'}, '<leader>y', '"+y')
    vim.keymap.set('n', '<leader>Y', '"+Y')
    vim.keymap.set({ "n", "v", "o" }, "n", "j");
    vim.keymap.set({ "o" }, "N", "J");

    vim.keymap.set({ "n", "v", "o" }, "e", "k");
    vim.keymap.set({ "n", "o" }, "E", "K");

    vim.keymap.set({ "n", "v", "o" }, "m", "h");
    vim.keymap.set({ "n", "v", "o" }, "M", "H");

    vim.keymap.set({ "n", "v", "o" }, "i", "l");
    vim.keymap.set({ "n", "v", "o" }, "I", "L");

    vim.keymap.set({ "v", "o" }, "j", "n");
    vim.keymap.set({ "v", "o" }, "J", "N");

    vim.keymap.set({ "n", "v", "o" }, "k", "e");
    vim.keymap.set({ "n", "v", "o" }, "K", "E");

    vim.keymap.set({ "n", "v", "o" }, "h", "m");
    vim.keymap.set({ "n", "v", "o" }, "H", "M");

    vim.keymap.set({ "n", "v", "o" }, "l", "i");
    vim.keymap.set({ "n", "v", "o" }, "L", "I");

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

if kb_layout == 'graphite' then
    vim.keymap.set({ "n", "v", "o" }, "y", "h", { noremap = true, silent = true });
    vim.keymap.set({ "n", "v", "o" }, "Y", "H", { noremap = true, silent = true });

    vim.keymap.set({ "n", "v", "o" }, "l", "y", { noremap = true, silent = true });
    vim.keymap.set({ "n", "v", "o" }, "L", "Y", { noremap = true, silent = true });

    vim.keymap.set({ "n", "v", "o" }, "k", "a", { noremap = true, silent = true });
    vim.keymap.set({ "n", "v", "o" }, "K", "A", { noremap = true, silent = true });

    vim.keymap.set({ "n", "v", "o" }, "a", "k", { noremap = true, silent = true });
    vim.keymap.set({ "n", "v", "o" }, "A", "K", { noremap = true, silent = true });

    vim.keymap.set({ "n", "v", "o" }, "e", "l", { noremap = true, silent = true });
    vim.keymap.set({ "n", "v", "o" }, "E", "L", { noremap = true, silent = true });

    vim.keymap.set({ "n", "v", "o" }, "j", "e", { noremap = true, silent = true });
    vim.keymap.set({ "v", "o" }, "J", "E", { noremap = true, silent = true });

    vim.keymap.set({ "n", "v", "o" }, "h", "j", { noremap = true, silent = true });
    vim.keymap.set({ "v", "o" }, "H", "J", { noremap = true, silent = true });

    vim.keymap.set({ 'n', 'v'}, '<leader>l', '"+y')
    vim.keymap.set('n', '<leader>L', '"+Y')

    vim.keymap.set('v', 'H', ":m '>+1<CR>gv=gv")
    vim.keymap.set('v', 'A', ":m '<-2<CR>gv=gv")

    vim.keymap.set('n', 'J', 'mzJ`z')

    vim.keymap.set('n', 'n', 'nzzzv')
    vim.keymap.set('n', 'N', 'Nzzzv')

    vim.keymap.set("n", "<C-w>y", "<C-w>h", { noremap = true, silent = true })
    vim.keymap.set("n", "<C-w>h", "<C-w>j", { noremap = true, silent = true })
    vim.keymap.set("n", "<C-W>a", "<C-W>k", { noremap = true, silent = true })
    vim.keymap.set("n", "<C-W>e", "<C-W>l", { noremap = true, silent = true })
end

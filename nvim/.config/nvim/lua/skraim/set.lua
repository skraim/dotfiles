vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

vim.opt.updatetime = 50

vim.opt.colorcolumn = "100"
vim.opt.timeoutlen = 500

vim.g.mapleader = " "

vim.api.nvim_create_autocmd("FileType", { 
    pattern = { "lua", "javascript", "typescript", "javascriptreact", "typescriptreact", "java", "hyprlang" }, 
    callback = function() 
        vim.opt_local.spell = true 
        vim.opt_local.spelllang = "en_us" 
        vim.opt_local.spelloptions = "camel" 
        vim.opt_local.spellcapcheck = ""
    end, 
})

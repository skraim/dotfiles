require("skraim.remap")
require("skraim.set")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- LSP and autocomplition --
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "saadparwaiz1/cmp_luasnip",
    {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        build = "make install_jsregexp"
    },
    "neovim/nvim-lspconfig",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    {
        "hrsh7th/nvim-cmp",
        event = { "InsertEnter", "CmdlineEnter" }
    },
    {
        "Exafunction/codeium.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "hrsh7th/nvim-cmp",
        },
        config = function()
            require("codeium").setup({
            })
        end
    },


    -- git --
    "lewis6991/gitsigns.nvim",
    "tpope/vim-fugitive",

    --     -- debug --
    --     "mfussenegger/nvim-dap",
    --     {
    --         "rcarriga/nvim-dap-ui",
    --         dependencies = {
    --             "mfussenegger/nvim-dap",
    --             "nvim-neotest/nvim-nio"
    --         }
    --     },

    -- misc --
    "nvim-tree/nvim-web-devicons",
    "mbbill/undotree",
    "brenoprata10/nvim-highlight-colors",
    "nvim-tree/nvim-tree.lua",
    "echasnovski/mini.ai",
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" }
    },
    {
        "bluz71/vim-nightfly-colors",
        name = "nightfly",
        lazy = false,
        priority = 1000
    },
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" }
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate"
    },
    "nvim-treesitter/nvim-treesitter-context",
    --     {
    --         "nvim-neotest/neotest",
    --         dependencies = {
    --             "nvim-neotest/nvim-nio",
    --             "nvim-lua/plenary.nvim",
    --             "antoinemadec/FixCursorHold.nvim",
    --             "nvim-treesitter/nvim-treesitter",
    --             "nvim-neotest/neotest-jest"
    --         }
    --     }
})

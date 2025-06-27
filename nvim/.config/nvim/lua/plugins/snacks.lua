return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
        bigfile = {
            enabled = true,
            notify = false
        },
        dim = { animate = { enabled = false } },
        indent = { enabled = true, animate = { enabled = false } },
        picker = {
            enabled = true,
            win = {
                input = {
                    keys = {
                        ["<C-c>"] = "cancel",
                        ["<c-u>"] = { "preview_scroll_up", mode = { "i", "n" } },
                        ["<c-d>"] = { "preview_scroll_down", mode = { "i", "n" } },
                        ["<c-h>"] = { "list_down", mode = { "i", "n" } },
                        ["<c-a>"] = { "list_up", mode = { "i", "n" } },
                        ["<c-w>Y"] = "layout_left",
                        ["<c-w>H"] = "layout_bottom",
                        ["<c-w>A"] = "layout_top",
                        ["<c-w>E"] = "layout_right",
                        ["h"] = "list_down",
                        ["a"] = "list_up",
                    }
                }
            }
        },
        quickfile = { enabled = true },
        scope = { enabled = true },
        statuscolumn = { enabled = true }
    },
    keys = {
        { "<leader><space>", function() Snacks.picker.smart({ hidden = true }) end,   desc = "Smart Find Files" },
        { "<leader>,",       function() Snacks.picker.buffers({ hidden = true }) end, desc = "Buffers" },
        { "<leader>/",       function() Snacks.picker.grep({ hidden = true }) end,    desc = "Grep" },
        { "<leader>ff",      function() Snacks.picker.files({ hidden = true }) end,   desc = "Find Files" },
        {
            "<leader>fg",
            function()
                Snacks.picker.git_files({
                    submodules = true,
                })
            end,
            desc = "Find Git Files"
        },
        {
            "<leader>gs",
            function()
                Snacks.picker.git_status({
                    submodules = true,
                })
            end,
            desc = "Find Git Files"
        },
        { "<leader>fw", function() Snacks.picker.grep_word({ hidden = true }) end, desc = "Visual selection or word", mode = { "n", "x" } },
        { "<leader>fm", function() Snacks.picker.marks() end,                      desc = "Marks" },

        { "gd",         function() Snacks.picker.lsp_definitions() end,            desc = "Goto Definition" },
        { "gD",         function() Snacks.picker.lsp_declarations() end,           desc = "Goto Declaration" },
        { "gr",         function() Snacks.picker.lsp_references() end,             nowait = true,                     desc = "References" },
        { "gI",         function() Snacks.picker.lsp_implementations() end,        desc = "Goto Implementation" },
        { "gy",         function() Snacks.picker.lsp_type_definitions() end,       desc = "Goto T[y]pe Definition" },

        { "<leader>Z",  function() Snacks.zen() end,                               desc = "Toggle Zen Mode" },
        { "<leader>z",  function() Snacks.zen.zoom() end,                          desc = "Toggle Zoom" },
        { "<leader>.",  function() Snacks.scratch() end,                           desc = "Toggle Scratch Buffer" },
        { "<leader>S",  function() Snacks.scratch.select() end,                    desc = "Select Scratch Buffer" },
        { "<C-/>",      function() Snacks.terminal() end,                          desc = "Toggle Terminal" }
    },
    init = function()
        vim.api.nvim_create_autocmd("User", {
            pattern = "VeryLazy",
            callback = function()
                Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>ts")
                Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>tw")
                Snacks.toggle.diagnostics():map("<leader>td")
                Snacks.toggle.inlay_hints():map("<leader>th")
            end,
        })
    end,
}

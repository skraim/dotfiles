return {
    {
        "0xrusowsky/nvim-ctx-ingest",
        dependencies = {
            "nvim-web-devicons",
        },
        opts = {}
    },
    {
        "azorng/goose.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            {
                "MeanderingProgrammer/render-markdown.nvim",
                opts = {
                    anti_conceal = { enabled = false },
                },
            },
        },
    },
    {
        "Exafunction/codeium.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "hrsh7th/nvim-cmp",
        },
        opts = {}
    },
}

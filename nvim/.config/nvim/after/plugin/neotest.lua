require("neotest").setup({
    adapters = {
        require("neotest-jest"),
        require("neotest-java")({
            dap = { console = "integratedTerminal" }, -- Налаштування для DAP
        })
    }
})

require('goose').setup({
    default_global_keymaps = false, -- If false, disables all default global keymaps
    keymap = {
        global = {
            toggle = '<leader>gg',           -- Open goose. Close if opened
            open_input = '<leader>gi',       -- Opens and focuses on input window on insert mode
            open_input_new_session = '<leader>gI', -- Opens and focuses on input window on insert mode. Creates a new session
            open_output = '<leader>go',      -- Opens and focuses on output window
            toggle_focus = '<leader>gt',     -- Toggle focus between goose and last window
            toggle_fullscreen = '<leader>gf', -- Toggle between normal and fullscreen mode
            select_session = '<leader>gS',   -- Select and load a goose session
            diff_open = '<leader>gd',        -- Opens a diff tab of a modified file since the last goose prompt
        },
        window = {
            submit = '<cr>',         -- Submit prompt
            close = '<esc>',         -- Close UI windows
            stop = '<C-c>',          -- Stop goose while it is running
            next_message = ']]',     -- Navigate to next message in the conversation
            prev_message = '[[',     -- Navigate to previous message in the conversation
            mention_file = '@',      -- Pick a file and add to context. See File Mentions section
            toggle_pane = '<tab>',   -- Toggle between input and output panes
            prev_prompt_history = '<up>', -- Navigate to previous prompt in history
            next_prompt_history = '<down>' -- Navigate to next prompt in history
        }
    },
    ui = {
        window_width = 0.35,  -- Width as percentage of editor width
        input_height = 0.15,  -- Input height as percentage of window height
        fullscreen = false,   -- Start in fullscreen mode (default: false)
        layout = "right",     -- Options: "center" or "right"
        floating_height = 0.8, -- Height as percentage of editor height for "center" layout
        display_model = true, -- Display model name on top winbar
        display_goose_mode = true -- Display mode on top winbar: auto|chat
    },
    providers = {
        openrouter = {
            "anthropic/claude-4-sonnet",
        }
    }
})

vim.api.nvim_set_hl(0, "GooseBorder", {
    ctermbg = "NONE",
    fg = "#82AAFF"
})

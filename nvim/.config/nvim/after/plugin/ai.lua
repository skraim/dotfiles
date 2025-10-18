local ingest = require("nvim-ctx-ingest")
local ingestUi = require('nvim-ctx-ingest.ui')

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  callback = function()
    if vim.bo.filetype == "nvim-ctx-ingest" then
      local opts = { buffer = true, nowait = true }
      vim.keymap.set("n", "y", function()
        ingestUi.handle_keypress("h")
      end, opts)
      vim.keymap.set("n", "h", "j", opts)
      vim.keymap.set("n", "a", "k", opts)
      vim.keymap.set("n", "e", function()
        ingestUi.handle_keypress("l")
      end, opts)
      vim.keymap.set("n", "<CR>", function()
        ingest.ingest()
      end, opts)
      vim.keymap.set("n", "p", function()
        ingestUi.handle_keypress(" ")
      end, opts)
      vim.keymap.set("n", "<ESC>", function()
        ingestUi.close_window()
      end, opts)
      vim.keymap.set("n", "q", function()
        ingestUi.close_window()
      end, opts)
      vim.keymap.set("n", "i", function()
        ingest.add_pattern("include")
      end, opts)
      vim.keymap.set("n", "x", function()
        ingest.add_pattern("exclude")
      end, opts)
    end
  end,
})

vim.keymap.set("n", "<leader>C", "<cmd>Codeium Toggle<CR>", { desc = "Toggle Codeium", noremap = true, silent = true })

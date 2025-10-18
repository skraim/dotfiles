return {
  {
    "0xrusowsky/nvim-ctx-ingest",
    dependencies = {
      "nvim-web-devicons",
    },
    opts = {}
  },
  {
    "Exafunction/codeium.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },
    opts = { quiet = true }
  },
  {
    "yetone/avante.nvim",
    build = "make",
    event = "VeryLazy",
    version = false,
    opts = {
      instructions_file = "avante.md",
      provider = "claude",
      providers = {
        claude = {
          endpoint = "https://api.anthropic.com",
          model = "claude-3-7-sonnet-latest",
          timeout = 30000,
          extra_request_body = {
            temperature = 0.3,
            max_tokens = 20480,
          },
        }
      },
      prompt_logger = {
        next_prompt = {
          normal = "<C-Down>",
          insert = "<C-Down>",
        },
        prev_prompt = {
          normal = "<C-Up>",
          insert = "<C-Up>",
        },
      },
      mappings = {
        submit = {
          insert = "<C-a>",
        },
      },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim"
    }
  }
}

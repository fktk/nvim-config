return {
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    version = false, -- set this if you want to always pull the latest change
    opts = {
      -- add any opts here
      provider = 'copilot',
      -- provider = 'groq',
      auto_suggestions_provider = 'copilot',
      cursor_applying_provider = 'copilot',
      copilot = {
        -- model = 'gpt-4.1',
        -- model = 'claude-3.5-sonnet',
      },
      vendors = {
        groq = {
          __inherited_from = 'openai',
          api_key_name = 'GROQ_API_KEY',
          endpoint = 'https://api.groq.com/openai/v1/',
          model = 'llama-3.3-70b-versatile',
          max_tokens = 32768,
        },
        ollama = {
          __inherited_from = 'openai',
          api_key_name = 'dummy',
          endpoint = 'http://localhot:11434/v1',
          model = 'qwen2.5:q4',
        },
      },
      behaviour = {
        auto_suggestions = true,
        auto_apply_diff_after_generation = true,
        enabled_cursor_planning_mode = true,
      },
      mappings = {
        submit = {
          normal = "<C-s>",
          insert = "<C-s>",
        },
      },
      windows = {
        edit = {
          start_insert = false,
        },
        ask = {
          start_insert = true,
        }
      },
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
      'nvim-telescope/telescope.nvim',
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      "zbirenbaum/copilot.lua", -- for providers='copilot'
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },
}

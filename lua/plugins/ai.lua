return {
  {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    config = function()
      vim.fn.setenv('OPENAI_API_KEY', 'dummy')
      vim.fn.setenv('OPENAI_API_HOST', 'http://localhost:8080')
      -- vim.fn.setenv('OPENAI_API_HOST', '')
      require("chatgpt").setup({
        openai_params = {
          max_tokens = 1000,
        }
      })
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "folke/trouble.nvim", -- optional
      "nvim-telescope/telescope.nvim"
    }
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = { enabled = false },
        panel = { enabled = false },
      })
    end,
  },
  -- {
  --   "yetone/avante.nvim",
  --   event = "VeryLazy",
  --   lazy = false,
  --   version = false, -- set this if you want to always pull the latest change
  --   opts = {
  --     -- add any opts here
  --     provider = 'openai',
  --     auto_suggestions_provider = 'openai',
  --     openai = {
  --       endpoint = 'http://localhost:8080/v1',
  --       allow_insecure = true,
  --     },
  --     behaviour = {
  --       auto_suggestions = false,
  --       auto_apply_diff_after_generation = true,
  --     },
  --     windows = {
  --       edit = {
  --         start_insert = false,
  --       },
  --       ask = {
  --         start_insert = false,
  --       }
  --     },
  --   },
  --   -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  --   build = "make",
  --   -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
  --   dependencies = {
  --     "stevearc/dressing.nvim",
  --     "nvim-lua/plenary.nvim",
  --     "MunifTanjim/nui.nvim",
  --     --- The below dependencies are optional,
  --     "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
  --     "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
  --     -- "zbirenbaum/copilot.lua", -- for providers='copilot'
  --     {
  --       -- support for image pasting
  --       "HakonHarnes/img-clip.nvim",
  --       event = "VeryLazy",
  --       opts = {
  --         -- recommended settings
  --         default = {
  --           embed_image_as_base64 = false,
  --           prompt_for_file_name = false,
  --           drag_and_drop = {
  --             insert_mode = true,
  --           },
  --           -- required for Windows users
  --           use_absolute_path = true,
  --         },
  --       },
  --     },
  --     {
  --       -- Make sure to set this up properly if you have lazy=true
  --       'MeanderingProgrammer/render-markdown.nvim',
  --       opts = {
  --         file_types = { "markdown", "Avante" },
  --       },
  --       ft = { "markdown", "Avante" },
  --     },
  --   },
  -- }
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "zbirenbaum/copilot.lua" },
      { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
    },
    build = "make tiktoken", -- Only on MacOS or Linux
    opts = {
      debug = true,
      window = {
        layout = 'float',
        relative = 'editor',
      },
      prompts = {
        Explain = {
          prompt = "/COPILOT_EXPLAIN 選択されたコードの説明を段落をつけて書いてください。",
        },
        Review = {
          prompt = "/COPILOT_REVIEW 選択されたコードをレビューしてください。",
          callback = function(response, source) end,
        },
        Fix = {
          prompt = "/COPILOT_FIX このコードには問題があります。バグを修正したコードに書き直してください。",
        },
        Optimize = {
          prompt = "/COPILOT_REFACTOR 選択されたコードを最適化してパフォーマンスと可読性を向上させてください。",
        },
        Docs = {
          prompt = "/COPILOT_DOCS 選択されたコードに対してドキュメンテーションコメントを追加してください。",
        },
        Tests = {
          prompt = "/COPILOT_TESTS 選択されたコードの詳細な単体テスト関数を書いてください。",
        },
      },
    },
    -- See Commands section for default commands if you want to lazy load on them
  },
}

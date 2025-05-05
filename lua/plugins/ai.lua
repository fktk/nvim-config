return {
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    version = false, -- set this if you want to always pull the latest change
    opts = {
      -- add any opts here
      system_prompt = function()
        local hub = require('mcphub').get_hub_instance()
        return hub:get_active_servers_prompt()
      end,
      custom_tools = function()
        return {
          require('mcphub.extensions.avante').mcp_tool(),
        }
      end,
      disabled_tools = {
        "list_files",
        "search_files",
        "read_file",
        "create_file",
        "rename_file",
        "delete_file",
        "create_dir",
        "rename_dir",
        "delete_dir",
        "bash",
      },
      -- provider = 'copilot',
      provider = 'copilot',
      -- auto_suggestions_provider = 'copilot',
      -- cursor_applying_provider = 'copilot',
      cursor_applying_provider = 'copilot',
      copilot = {
        model = 'gpt-4.1',
        -- model = 'claude-3.5-sonnet',
      },
      gemini = {
        model = 'gemini-1.5-flash',
      },
      vendors = {
        groq = {
          __inherited_from = 'openai',
          api_key_name = 'GROQ_API_KEY',
          endpoint = 'https://api.groq.com/openai/v1/',
          model = 'meta-llama/llama-4-scout-17b-16e-instruct',
          max_tokens = 8192,
        },
      },
      behaviour = {
        auto_suggestions = false,
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
          start_insert = true,
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
    -- config = function(_, opts)
    --   require('avante').setup({
    --   })
    -- end,
  },
  {
    'ravitemer/mcphub.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    build = 'npm install -g mcp-hub@latest',
    config = function()
      require('mcphub').setup({
        extensions = {
          avante = {
            make_slash_commands = true,
          }
        }
      })
    end,
  },
}

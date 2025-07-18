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
        return hub and hub:get_active_servers_prompt() or ""
      end,
      custom_tools = function()
        return {
          require('mcphub.extensions.avante').mcp_tool(),
        }
      end,
      provider = 'copilot',
      cursor_applying_provider = 'copilot',
      providers = {
        copilot = {
          -- model = 'gpt-4.1',
          model = function()
            if vim.fn.has('win32') == 1 then
              return "claude-sonnet-4"
            else
              return 'claude-3.5-sonnet'
            end
          end,
          -- disable_tools = true,
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
      },
      behaviour = {
        auto_suggestions = false,
        auto_apply_diff_after_generation = true,
        enabled_cursor_planning_mode = true,
      },
      mappings = {
        submit = {
          normal = "<C-l>",
          insert = "<C-l>",
        },
      },
      windows = {
        edit = {
          start_insert = true,
        },
        ask = {
          start_insert = true,
        },
        width = 80,
      },
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = function()
      if vim.fn.has('win32') == 1 then
        return "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
      else
        return 'make'
      end
    end,
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
          file_types = { "Avante" },
        },
        ft = { "Avante" },
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
        },
        log = {
          level = vim.log.levels.TRACE,
          to_file = true,
          file_path = '/home/tk/projects/mcp/mcp.log'
        },
        auto_approve = true,
      })
    end,
  },
}

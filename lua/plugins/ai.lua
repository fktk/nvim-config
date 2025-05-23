return {
  {
    "olimorris/codecompanion.nvim",
    opts = {
      extensions = {
        mcphub = {
          callback = 'mcphub.extensions.codecompanion',
          opts = {
            make_vars = true,
            make_slash_commands = true,
            show_result_in_chat = true,
          },
        },
      },
      strategies = {
        chat = {
          adapter = 'copilot',
          keymaps = {
            send = {
              modes = {
                i = { "<C-l>" },
                n = { "<C-l>" },
              },
            },
          },
        },
        inline = {
          adapter = 'copilot'
        },
        cmd = {
          adapter = 'copilot'
        },
      },
      adapters = {
        copilot = function()
          return require('codecompanion.adapters').extend('copilot', {
            schema = {
              model = {
                default = "gpt-4.1",
              },
            },
          })
        end,
      }
    },
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      'nvim-telescope/telescope.nvim',
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      "zbirenbaum/copilot.lua", -- for providers='copilot'
      {
        'ravitemer/mcphub.nvim',
        dependencies = { 'nvim-lua/plenary.nvim', },
        build = 'npm install -g mcp-hub@latest',
      },
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        cmd = "PasteImage",
        event = "VeryLazy",
        opts = {
          filetype = {
            codecompanion = {
              prompt_for_name = false,
              template = "[Image]($FILE_PATH)",
              use_absolute_path = true,
            }
          }
        },
      },
      {
        'echasnovski/mini.diff',
        config = function()
          local diff = require('mini.diff')
          diff.setup({
            source = diff.gen_source.none(),
          })
        end,
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        'MeanderingProgrammer/render-markdown.nvim',
        ft = { "markdown", "codecompanion" },
      },
    },
  },
}

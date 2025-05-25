return {
  {
    'ravitemer/mcphub.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', },
    build = 'npm install -g mcp-hub@latest',
    config = function()
      require('mcphub').setup()
    end,
  },
  -- {
  --   'CopilotC-Nvim/CopilotChat.nvim',
  --   dependencies = {
  --     { 'zbirenbaum/copilot.lua' },
  --     { 'nvim-lua/plenary.nvim', branch = 'master' },
  --   },
  --   -- build = 'make tiktoken',
  --   opts = {
  --     mappings = {
  --       submit_prompt = {
  --         normal = '<C-l>',
  --         insert = '<C-l>',
  --       },
  --     },
  --   },
  --   config = function(_, opts)
  --     require('CopilotChat').setup(opts)
  --   end,
  -- },
}

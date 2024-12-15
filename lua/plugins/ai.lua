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
}

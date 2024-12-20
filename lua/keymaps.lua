local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap('i', 'jj', '<ESC>', opts)
vim.api.nvim_set_keymap('n', '<Esc><Esc>', ':nohl<CR>', opts)
vim.api.nvim_set_keymap('n', 'j', 'gj', { noremap = true })
vim.api.nvim_set_keymap('n', 'k', 'gk', { noremap = true })

function ShowCopilotChatActionPrompt()
  local actions = require("CopilotChat.actions")
  require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
end
vim.api.nvim_set_keymap(
  "n",
  "<leader>0",
  "<cmd>lua ShowCopilotChatActionPrompt()<cr>",
  { noremap = true, silent = true }
)

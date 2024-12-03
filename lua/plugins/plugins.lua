
return {
    {
        'folke/tokyonight.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd([[colorscheme tokyonight]])
        end,
    },
    {
        'windwp/nvim-autopairs',
        event = 'InsertEnter',
        config = true
    },
    {
        'echasnovski/mini.surround',
        version = '*',
        config = function()
            require('mini.surround').setup()
	end
    },
    {
        'echasnovski/mini.statusline',
        version = '*',
        config = function()
            require('mini.statusline').setup()
	end
    },
    { 'tpope/vim-sleuth' },
    
}

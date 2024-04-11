-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'ThePrimeagen/vim-be-good',
  },
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
      'MunifTanjim/nui.nvim',
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    opts = {
      filesystem = {
        filtered_items = {
          visible = true,
          show_hidden_count = true,
          hide_dotfiles = false,
          hide_gitignored = true,
          hide_by_name = {
            -- '.git',
            --  '.DS_Store',
            -- 'thumbs.db',
          },
          never_show = {},
        },
      },
    },
    config = function()
      vim.keymap.set('n', '<leader>el', '<cmd>:Neotree filesystem reveal left<CR>', { desc = 'Neotree reveal filesystem left' })
      vim.keymap.set('n', '<leader>ec', '<cmd>:Neotree filesystem close <CR>', { desc = 'Neotree close filesystem' })
    end,
  },
}

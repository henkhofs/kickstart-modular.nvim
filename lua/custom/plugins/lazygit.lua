-- nvim v0.8.0
return {
  'kdheepak/lazygit.nvim',
  cmd = {
    'LazyGit',
    'LazyGitConfig',
    'LazyGitCurrentFile',
    'LazyGitFilter',
    'LazyGitFilterCurrentFile',
  },
  -- optional for floating window border decoration
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
  },
  config = function()
    require('telescope').load_extension 'lazygit'
    vim.keymap.set('n', '<leader>gg', function()
      -- if keymap <Esc><Esc> is set in terminal mode, remove it.
      -- this is to enable <Esc> to navigate in LazyGit which otherwise
      -- is overridden for terminal usage.
      local terminal_keymaps = vim.api.nvim_get_keymap 't'
      -- vim.notify(vim.inspect(terminal_keymaps))
      for _, keymap in pairs(terminal_keymaps) do
        if keymap.lhs == '<Esc><Esc>' then
          vim.api.nvim_del_keymap('t', '<Esc><Esc>')
        end
      end
      vim.cmd 'LazyGit'
    end, { desc = 'LazyGit', noremap = false, silent = true })
  end,
  -- setting the keybinding for LazyGit with 'keys' is recommended in
  -- order to load the plugin when the command is run for the first time
  keys = {
    { '<leader>gg', '<cmd>LazyGit<cr>', desc = 'LazyGit' },
  },
}

-- Unless you are still migrating, remove the deprecated commands from v1.x
vim.cmd [[ let g:neo_tree_remove_legacy_commands = 1 ]]

vim.keymap.set('n', '<leader>o', ':Neotree filesystem reveal left<CR>')

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  config = function()
    require('neo-tree').setup {
      source_selector = {
        winbar = true,
        statusline = false,
      },
      window = {
        mappings = {
          ['P'] = { 'toggle_preview', config = { use_float = false, use_image_nvim = true } },
          ['<leader>o'] = {
            function()
              if vim.bo.filetype == 'neo-tree' then
                vim.cmd.wincmd 'p'
              else
                vim.cmd.Neotree 'focus'
              end
            end,
            desc = 'Toggle Explorer Focus',
          },
        },
      },
    }
  end,
}


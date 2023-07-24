return {
  'freddiehaddad/feline.nvim',
  init = function ()
    vim.opt.termguicolors = true
  end,
  config = function ()
    local theme = require('themes/feline_gruvbox')
    require('feline').setup(theme)
  end,
  dependencies = {
    {'nvim-tree/nvim-web-devicons'},
    {
      'lewis6991/gitsigns.nvim',
      -- this one can't be lazy loaded
      config = function()
        require('gitsigns').setup()
      end,
    },
  },
}

return {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v2.x',
  dependencies = {
    -- LSP Support
    {'neovim/nvim-lspconfig'}, -- Required
    {
      'williamboman/mason.nvim', -- Optional
      build = function ()
        pcall(vim.api.nvim_command, 'MasonUpdate')
      end,
    },
    {'williamboman/mason-lspconfig.nvim'}, -- Optional

    -- Autocompletion
    {'hrsh7th/nvim-cmp'},     -- Required
    {'hrsh7th/cmp-nvim-lsp'}, -- Required
    {'L3MON4D3/LuaSnip'},     -- Required
  },
  config = function()
    local lsp = require('lsp-zero').preset({})

    lsp.on_attach(function(--[[client]]_, bufnr)
      -- see :help lsp-zero-keybindings
      -- to learn the available actions
      lsp.default_keymaps({buffer = bufnr})
    end)

    -- disable semantic highlights, we're using treesitter now
    lsp.set_server_config({
      on_init = function(client)
        client.server_capabilities.semanticTokensProvider = nil
      end,
    })

    -- (Optional) Configure lua language server for neovim
    require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

    lsp.setup()
  end,
}

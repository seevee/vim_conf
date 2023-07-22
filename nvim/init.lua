local lazy_path = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazy_path) then
	vim.notify('Bootstrapping lazy.nvim...', vim.log.levels.INFO)
	vim.fn.system({
		'git',
		'clone',
		'--filter=blob:none',
		'https://github.com/folke/lazy.nvim.git',
		'--branch=stable', -- latest stable release
		lazy_path,
	})
end
-- Add lazy.nvim to rtp
vim.opt.runtimepath:prepend(lazy_path)

-- recommended by lazy docs
vim.g.mapleader = ','

require('lazy').setup({
	{
		'freddiehaddad/feline.nvim',
		init = function ()
			vim.opt.termguicolors = true
		end,
		config = function ()
			local theme = require('feline_gruvbox')
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
	},
	{
		'ellisonleao/gruvbox.nvim',
		priority = 1000,
		init = function()
			vim.opt.background = 'dark'
		end,
		config = function()
			require('gruvbox').setup()
			vim.cmd([[colorscheme gruvbox]])
		end,
	},
	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		dependencies = {
			-- LSP Support
			{'neovim/nvim-lspconfig'}, -- Required
			{                          -- Optional
				'williamboman/mason.nvim',
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

			-- disable semantic highlights
			lsp.set_server_config({
				on_init = function(client)
					client.server_capabilities.semanticTokensProvider = nil
				end,
			})

			-- (Optional) Configure lua language server for neovim
			require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

			lsp.setup()
		end,
	},
	{
		'nvim-treesitter/nvim-treesitter',
		build = ':TSUpdate',
		config = function()
			local configs = require('nvim-treesitter.configs')

			configs.setup({
				sync_install = false,
				auto_install = true,
				highlight = {enable = true},
			})
		end,
	},
})

-- general settings
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2

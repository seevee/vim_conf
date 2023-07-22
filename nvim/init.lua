require('settings')
require('remap')

-- lazy.nvim package manager
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

-- Load all plugins in lua/plugins
require('lazy').setup('plugins')

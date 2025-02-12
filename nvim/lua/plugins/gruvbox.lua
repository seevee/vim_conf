return {
	"ellisonleao/gruvbox.nvim",
	priority = 1000,
	init = function()
		vim.opt.background = "dark"
	end,
	config = function()
		require("gruvbox").setup({
			transparent_mode = true,
		})
		vim.cmd([[colorscheme gruvbox]])
	end,
}

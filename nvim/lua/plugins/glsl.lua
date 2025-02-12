return {
	"timtro/glslView-nvim",
	cmd = "GlslView",
	opts = {},
	keys = {
		{ "<leader>v", ft = "glsl", desc = "GLSL" },
		{ "<leader>vg", "<cmd>GlslView -w 256 -l 256<cr>", ft = "glsl", desc = "Run glslViewer" },
	},
}

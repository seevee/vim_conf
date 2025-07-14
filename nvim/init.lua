if vim.g.vscode then
	-- VSCode extension
else
	-- ordinary Neovim
	require("config.lazy")
	require("settings")
	require("remap")
end

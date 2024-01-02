return {
	"OmniSharp/omnisharp-vim",
	init = function()
		require("lazyvim.util").lsp.on_attach(function(client, _)
			if client.name == "omnisharp" then
				local tokenModifiers = client.server_capabilities.semanticTokensProvider.legend.tokenModifiers
				for i, v in ipairs(tokenModifiers) do
					tokenModifiers[i] = v:gsub(" ", "_")
				end
				---@type string[]
				local tokenTypes = client.server_capabilities.semanticTokensProvider.legend.tokenTypes
				for i, v in ipairs(tokenTypes) do
					tokenTypes[i] = v:gsub(" ", "_")
				end
			end
		end)
	end,
}

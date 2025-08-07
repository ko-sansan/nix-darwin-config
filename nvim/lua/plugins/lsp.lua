return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				-- Go
				gopls = {
					mason = false,
					settings = {
						gopls = {
							analyses = {
								unusedparams = true,
							},
							staticcheck = true,
						},
					},
				},

				-- TypeScript / JavaScript
				vtsls = {},

				-- Ruby
				ruby_lsp = {
					mason = false,
				},

				-- JSON
				jsonls = {},

				-- typo
				typos_lsp = {},
			},
		},
	},
}

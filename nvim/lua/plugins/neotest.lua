return {
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-neotest/nvim-nio",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-neotest/neotest-jest",
			"olimorris/neotest-rspec",
		},
		opts = function(_, opts)
			opts.adapters = {
				require("neotest-jest")({
					jestCommand = "npm test --", -- または "yarn test --"
					jestConfigFile = "jest.config.js",
					env = { CI = true },
					cwd = vim.fn.getcwd,
				}),
				require("neotest-rspec")({
					rspec_cmd = function()
						return { "bundle", "exec", "rspec" }
					end,
				}),
			}
		end,
	},
}

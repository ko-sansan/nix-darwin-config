return {
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-neotest/nvim-nio",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-neotest/neotest-jest",
			"nvim-neotest/neotest-go",
			"olimorris/neotest-rspec",
		},
		config = function()
			local neotest = require("neotest")

			-- キーマッピング（例）
			vim.keymap.set("n", "<leader>tt", function()
				neotest.run.run()
			end, { desc = "Run nearest test" })

			vim.keymap.set("n", "<leader>tT", function()
				neotest.run.run(vim.fn.expand("%"))
			end, { desc = "Run all tests in file" })

			vim.keymap.set("n", "<leader>to", function()
				neotest.output.open({ enter = true })
			end, { desc = "Show test output" })

			vim.keymap.set("n", "<leader>ts", function()
				neotest.summary.toggle()
			end, { desc = "Toggle test summary" })
		end,
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

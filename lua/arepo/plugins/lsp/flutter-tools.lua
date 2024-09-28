return {
	"akinsho/flutter-tools.nvim",
	event = "VeryLazy",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"stevearc/dressing.nvim",
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		require("flutter-tools").setup({
			flutter_path = nil,
			fvm = false,
			widget_guides = { enabled = true },
			lsp = {
				settings = {
					showtodos = true,
					completefunctioncalls = true,
					analysisexcludedfolders = {
						vim.fn.expand("$Home/.pub-cache"),
					},
					renamefileswithclasses = "prompt",
					updateimportsonrename = true,
					enablesnippets = false,
				},
			},
			debugger = {
				enabled = true,
				run_via_dap = true,
				exception_breakpoints = {},
				register_configurations = function(paths)
					local dap = require("dap")
					-- See also: https://github.com/akinsho/flutter-tools.nvim/pull/292
					dap.adapters.dart = {
						type = "executable",
						command = paths.flutter_bin,
						args = { "debug-adapter" },
					}
					dap.configurations.dart = {}
					require("dap.ext.vscode").load_launchjs()
				end,
			},
		})
		local telescope = require("telescope")
		telescope.load_extension("flutter")
	end,
}

-- Example of .vscode/launch.json
-- {
--   "version": "0.0.1",
--   "configurations": [
--     {
--       "name": "Run app for Dev",
--       "program": "${workspaceFolder}/lib/main.dart",
--       "request": "launch",
--       "type": "dart",
--       "flutterMode": "debug",
--       "args": [
--         "--debug",
--         "--flavor",
--         "dev",
--         "--dart-define-from-file=define/flavor/dev/common.json",
--         "--dart-define-from-file=define/flavor/dev/firebase_options.json"
--       ]
--     },
--     {
--       "name": "Run app for Prd",
--       "program": "${workspaceFolder}/lib/main.dart",
--       "request": "launch",
--       "type": "dart",
--       "flutterMode": "debug",
--       "args": [
--         "--debug",
--         "--flavor",
--         "prd",
--         "--dart-define-from-file=define/flavor/prd/common.json",
--         "--dart-define-from-file=define/flavor/prd/firebase_options.json"
--       ]
--     }
--   ]
-- }

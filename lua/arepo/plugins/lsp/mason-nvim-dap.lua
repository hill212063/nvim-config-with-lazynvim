return {
	"jay-babu/mason-nvim-dap.nvim",
	event = "VeryLazy",
	dependencies = {
		"williamboman/mason.nvim",
		"mfussenegger/nvim-dap",
	},
	opt = {
		handlers = {},
	},
	config = function()
		require("mason-nvim-dap").setup({
			handlers = {
				function(config)
					-- all sources with no handler get passed here

					-- Keep original functionality
					require("mason-nvim-dap").default_setup(config)
				end,
				python = function(config)
					config.adapters = {
						type = "executable",
						command = vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python",
						args = { "-m", "debugpy.adapter" },
					}
					require("mason-nvim-dap").default_setup(config)
				end,
				delve = function(config)
					config.adapters.go = {
						type = "server",
						port = "${port}",
						executable = {
							command = vim.fn.stdpath("data") .. "/mason/bin/dlv",
							args = { "dap", "-l", "127.0.0.1:${port}" },
						},
					}
					config.configurations.go = {
						{
							type = "go",
							name = "Debug",
							request = "launch",
							showLog = false,
							program = "${file}",
							dlvToolPath = vim.fn.exepath("dlv"), -- Adjust to where delve is installed
						},
					}
					require("mason-nvim-dap").default_setup(config)
				end,
			},
		})
	end,
}

-- List of available adapter
-- M.nvim_dap_to_package = {
-- 	['python'] = 'debugpy',
-- 	['cppdbg'] = 'cpptools',
-- 	['delve'] = 'delve',
-- 	['node2'] = 'node-debug2-adapter',
-- 	['chrome'] = 'chrome-debug-adapter',
-- 	['firefox'] = 'firefox-debug-adapter',
-- 	['php'] = 'php-debug-adapter',
-- 	['coreclr'] = 'netcoredbg',
-- 	['js'] = 'js-debug-adapter',
-- 	['codelldb'] = 'codelldb',
-- 	['bash'] = 'bash-debug-adapter',
-- 	['javadbg'] = 'java-debug-adapter',
-- 	['javatest'] = 'java-test',
-- 	['mock'] = 'mockdebug',
-- 	['puppet'] = 'puppet-editor-services',
-- 	['elixir'] = 'elixir-ls',
-- 	['kotlin'] = 'kotlin-debug-adapter',
-- 	['dart'] = 'dart-debug-adapter',
-- 	['haskell'] = 'haskell-debug-adapter',
-- 	['erlang'] = 'erlang-debugger',
-- }

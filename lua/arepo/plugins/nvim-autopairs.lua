return {
	"windwp/nvim-autopairs",
	lazy = true,
	event = "InsertEnter",
	opts = {
		disable_filetype = { "TelescopePrompt", "vim" },
		enable_check_bracket_line = false,
	},
	config = true,
}

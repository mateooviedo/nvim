return {
	"rose-pine/neovim",
	config = function()
		vim.fn.sign_define({
			{
				name = "DiagnosticSignError",
				text = "",
				texthl = "DiagnosticSignError",
				linehl = "ErrorLine",
			},
			{
				name = "DiagnosticSignWarn",
				text = "",
				texthl = "DiagnosticSignWarn",
				linehl = "WarningLine",
			},
			{
				name = "DiagnosticSignInfo",
				text = "",
				texthl = "DiagnosticSignInfo",
				linehl = "InfoLine",
			},
			{
				name = "DiagnosticSignHint",
				text = "",
				texthl = "DiagnosticSignHint",
				linehl = "HintLine",
			},
		})

		-- load the colorscheme here
		-- vim.opt.background = "dark"
	end,
}

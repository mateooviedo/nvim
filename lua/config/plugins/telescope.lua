local tele = require("telescope")

local M = {}

function M.setup()
	tele.setup({
		extensions = {
			fzf = {
				fuzzy = true, -- false will only do exact matching
				override_generic_sorter = true, -- override the generic sorter
				override_file_sorter = true, -- override the file sorter
				case_mode = "smart_case", -- or "ignore_case" or "respect_case"
				-- the default case_mode is "smart_case"
			},
			file_browser = {
				theme = "ivy",
				-- disables netrw and use telescope-file-browser in its place
				hijack_netrw = true,
				mappings = {
					["i"] = {
						-- your custom insert mode mappings
					},
					["n"] = {
						-- your custom normal mode mappings
					},
				},
			},
		},
	})

	tele.load_extension("notify")
	tele.load_extension("fzf")
	-- tele.load_extension("bookmarks")
	tele.load_extension("conventional_commits")
	tele.load_extension("vim_bookmarks")
	tele.load_extension("file_browser")
end

return M

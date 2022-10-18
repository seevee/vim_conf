local line_ok, feline = pcall(require, 'feline')
if not line_ok then
	return
end

local gruvbox = {
	fg = '#928374',
	bg = '#1F2223',
	black ='#1B1B1B',
	skyblue = '#458588',
	cyan = '#83a597',
	green = '#689d6a',
	oceanblue = '#1d2021',
	magenta = '#fb4934',
	orange = '#fabd2f',
	red = '#cc241d',
	violet = '#b16286',
	white = '#ebdbb2',
	yellow = '#d79921',
}

local vi_mode_colors = {
	NORMAL = "green",
	OP = "green",
	INSERT = "yellow",
	VISUAL = "violet",
	LINES = "orange",
	BLOCK = "red",
	REPLACE = "magenta",
	COMMAND = "skyblue",
}

local c = {
	vim_mode = {
		provider = {
			name = "vi_mode",
			opts = {
				show_mode_name = true,
				-- padding = "center", -- Uncomment for extra padding.
			},
		},
		hl = function()
			return {
				fg = require("feline.providers.vi_mode").get_mode_color(),
				bg = "black",
				style = "bold",
				name = "NeovimModeHLColor",
			}
		end,
		left_sep = "block",
		right_sep = "block",
	},
	gitBranch = {
		provider = "git_branch",
		hl = {
			fg = "white",
			bg = "black",
			style = "bold",
		},
		left_sep = "block",
		right_sep = "block",
	},
	gitDiffAdded = {
		provider = "git_diff_added",
		hl = {
			fg = "green",
			bg = "black",
		},
		left_sep = "block",
		right_sep = "block",
	},
	gitDiffRemoved = {
		provider = "git_diff_removed",
		hl = {
			fg = "magenta",
			bg = "black",
		},
		left_sep = "block",
		right_sep = "right_filled",
	},
	gitDiffChanged = {
		provider = "git_diff_changed",
		hl = {
			fg = "fg",
			bg = "black",
		},
		left_sep = "block",
		right_sep = "right_filled",
	},
	separator = {
		provider = "",
	},
	fileinfo = {
		provider = {
			name = "file_info",
			opts = {
				type = "relative-short",
			},
		},
		hl = {
			style = "bold",
		},
		left_sep = " ",
		right_sep = " ",
	},
	diagnostic_errors = {
		provider = "diagnostic_errors",
		hl = {
			fg = "magenta",
		},
	},
	diagnostic_warnings = {
		provider = "diagnostic_warnings",
		hl = {
			fg = "yellow",
		},
	},
	diagnostic_hints = {
		provider = "diagnostic_hints",
		hl = {
			fg = "skyblue",
		},
	},
	diagnostic_info = {
		provider = "diagnostic_info",
	},
	lsp_client_names = {
		provider = "lsp_client_names",
		hl = {
			fg = "violet",
			bg = "black",
			style = "bold",
		},
		left_sep = "left_filled",
		right_sep = "block",
	},
	file_type = {
		provider = {
			name = "file_type",
			opts = {
				filetype_icon = true,
				case = "titlecase",
			},
		},
		hl = {
			fg = "magenta",
			bg = "black",
			style = "bold",
		},
		left_sep = "left_filled",
		right_sep = "block",
	},
	file_encoding = {
		provider = "file_encoding",
		hl = {
			fg = "orange",
			bg = "black",
			style = "italic",
		},
		left_sep = "block",
		right_sep = "block",
	},
	position = {
		provider = "position",
		hl = {
			fg = "green",
			bg = "black",
			style = "bold",
		},
		left_sep = "block",
		right_sep = "block",
	},
	line_percentage = {
		provider = "line_percentage",
		hl = {
			fg = "skyblue",
			bg = "black",
			style = "bold",
		},
		left_sep = "block",
		right_sep = "block",
	},
	scroll_bar = {
		provider = "scroll_bar",
		hl = {
			fg = "yellow",
			bg = "black",
			style = "bold",
		},
	},
}

local left = {
	c.vim_mode,
	c.gitBranch,
	c.gitDiffAdded,
	c.gitDiffRemoved,
	c.gitDiffChanged,
	c.separator,
}

local middle = {
	c.fileinfo,
	c.diagnostic_errors,
	c.diagnostic_warnings,
	c.diagnostic_info,
	c.diagnostic_hints,
}

local right = {
	c.lsp_client_names,
	c.file_type,
	c.file_encoding,
	c.position,
	c.line_percentage,
	c.scroll_bar,
}

local components = {
	active = {
		left,
		middle,
		right,
	},
	inactive = {
		left,
		middle,
		right,
	},
}

feline.setup({
	components = components,
	theme = gruvbox,
	vi_mode_colors = vi_mode_colors,
})


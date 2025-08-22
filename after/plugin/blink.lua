require("copilot").setup()
require("blink.cmp").setup({
	cmdline = {
		completion = { menu = { auto_show = true } },
	},
	completion = {
		menu = {
			border = "rounded",
			winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,CursorLine:BlinkCmpDocCursorLine,Search:None",
		},
		documentation = {
			auto_show = true,
			treesitter_highlighting = true,
			window = { border = "rounded" },
		},
	},
	signature = {
		enabled = true,
		window = { border = "rounded" },
	},
	appearance = {
		nerd_font_variant = "mono",
	},
	sources = {
		default = { "lsp", "path", "snippets", "buffer", "copilot" },
		providers = {
			copilot = {
				name = "copilot",
				module = "blink-cmp-copilot",
				async = true,
				transform_items = function(_, items)
					local CompletionItemKind = require("blink.cmp.types").CompletionItemKind
					local kind_idx = #CompletionItemKind + 1
					CompletionItemKind[kind_idx] = "Copilot"
					for _, item in ipairs(items) do
						item.kind = kind_idx
					end
					return items
				end,
			},
		},
	},
})

return {
	{
		"blink.cmp",
		event = "InsertEnter",
		after = function()
			require("blink.cmp").setup({
				cmdline = {
					completion = { menu = { auto_show = true } },
				},
        completion = {
          menu = {
            border = "rounded",
            winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,CursorLine:BlinkCmpDocCursorLine,Search:None",
          };
          documentation = {
            auto_show = true,
            treesitter_highlighting = true,
            window = {border = "rounded"},
          },
        },
        signature = {
          enabled = true,
          window = { border = "rounded" }
        },
				appearance = {
					use_nvim_cmp_as_default = true,
					nerd_font_variant = "mono",
					kind_icons = {
						Copilot = "",
						Text = "󰉿",
						Method = "󰊕",
						Function = "󰊕",
						Constructor = "󰒓",
						Field = "󰜢",
						Variable = "󰆦",
						Property = "󰖷",
						Class = "󱡠",
						Interface = "󱡠",
						Struct = "󱡠",
						Module = "󰅩",
						Unit = "󰪚",
						Value = "󰦨",
						Enum = "󰦨",
						EnumMember = "󰦨",
						Keyword = "󰻾",
						Constant = "󰏿",
						Snippet = "󱄽",
						Color = "󰏘",
						File = "󰈔",
						Reference = "󰬲",
						Folder = "󰉋",
						Event = "󱐋",
						Operator = "󰪚",
						TypeParameter = "󰬛",
					},
				},
				sources = {
					default = { "lsp", "path", "snippets", "buffer", "copilot" },
					providers = {
						copilot = {
							name = "copilot",
							module = "blink-cmp-copilot",
							score_offset = 100,
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
		end,
	},
  {
		"blink-cmp-copilot",
		dep_of = "blink.cmp",
	},
  {
    "friendly-snippets",
    dep_of = "blink.cmp"
  },
	{
		"copilot.lua",
		dep_of = "blink-cmp-copilot",
		cmd = "Copilot",
		after = function()
			require("copilot").setup()
		end,
	},
}

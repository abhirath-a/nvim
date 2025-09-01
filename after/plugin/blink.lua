require("blink.cmp").setup({
	cmdline = {
		completion = { menu = { auto_show = true } },
	},
	completion = {
		menu = {
			border = "rounded",
			-- makes blink-cmp look nice with kanagawa. idk where I got it from tho.
			winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,CursorLine:BlinkCmpDocCursorLine,Search:None",
		},
	},
	signature = {
		enabled = true,
		window = { border = "rounded" },
	},
	appearance = {
		nerd_font_variant = "mono",
	},
})

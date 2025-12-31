return {
	"saghen/blink.cmp",
	opts = {
		keymap = {

			-- Confirm completion with Tab
			["<Tab>"] = { "accept", "fallback" },

			-- -- Optional but recommended
			["<C-n>"] = { "select_next", "fallback" },
			["<C-p>"] = { "select_prev", "fallback" },

			-- Disable Enter for confirmation
			["<CR>"] = {},
		},
	},
}

return {
	-- comment
	-- { "JoosepAlviste/nvim-ts-context-commentstring", lazy = true },
	-- {
	-- 	"echasnovski/mini.comment",
	-- 	event = "VeryLazy",
	-- 	opts = {
	-- 		mappings = {
	-- 			comment = "<C-/>",
	-- 			comment_line = "<C-/>",
	-- 			textobject = "<C-/>",
	-- 		},
	-- 		hooks = {
	-- 			pre = function()
	-- 				require("ts_context_commentstring.internal").update_commentstring({})
	-- 			end,
	-- 		},
	-- 	},
	-- 	config = function(_, opts)
	-- 		require("mini.comment").setup(opts)
	-- 	end,
	-- },

	-- add this to your lua/plugins.lua, lua/plugins/init.lua,  or the file you keep your other plugins:
	{
		"numToStr/Comment.nvim",
		opts = {
			toggler = {
				---Line-comment toggle keymap
				line = "<C-/>",
				---Block-comment toggle keymap
				block = "gbc",
			},
			opleader = {
				---Line-comment keymap
				line = "<C-/>",
				---Block-comment keymap
				block = "gb",
			},
		},
		lazy = false,
	},
}

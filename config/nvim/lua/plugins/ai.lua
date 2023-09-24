return {
	{
		"github/copilot.vim",
		event = "VeryLazy",
		config = function()
			vim.g.copilot_no_tab_map = true
			vim.api.nvim_set_keymap("i", "<C-I>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
		end,
	},
	{
		"jackMort/ChatGPT.nvim",
		event = "VeryLazy",
		-- enabled = false,
		dependencies = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
		config = function()
			require("chatgpt").setup({
				-- optional configuration
			})
		end,
	},
}

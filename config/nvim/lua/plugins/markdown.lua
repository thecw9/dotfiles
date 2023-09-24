return {
	{
		"richardbizik/nvim-toc",
		config = function()
			require("nvim-toc").setup({})
		end,
	},
	{
		"iamcco/markdown-preview.nvim",
		-- build = "cd app && npm install",
		-- init = function()
		-- 	vim.g.mkdp_filetypes = { "markdown" }
		-- end,
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
		config = function()
			vim.cmd([[let g:mkdp_auto_start = 0]])
			vim.cmd([[let g:mkdp_browser = 'microsoft-edge-stable']])
			vim.cmd([[let g:mkdp_port = 8080]])
		end,
	},
}

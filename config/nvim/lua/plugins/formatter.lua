return {
	{
		"mhartington/formatter.nvim",
		enabled = false,
		config = function()
			local util = require("formatter.util")
			require("formatter").setup({
				logging = true,
				log_level = vim.log.levels.WARN,
				filetype = {
					lua = {
						require("formatter.filetypes.lua").stylua,
					},
					python = {
						require("formatter.filetypes.python").yapf,
						require("formatter.filetypes.python").isort,
					},
					markdown = {
						require("formatter.filetypes.markdown").prettier,
					},
					latex = {
						require("formatter.filetypes.latex").latexindent,
					},
					["*"] = {
						require("formatter.filetypes.any").remove_trailing_whitespace,
					},
				},
			})
		end,
	},
	{
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup({
				format_on_save = {
					-- These options will be passed to conform.format()
					timeout_ms = 500,
					lsp_fallback = true,
				},
				formatters_by_ft = {
					python = { "isort", "black" },
					rust = { "rustfmt" },
					go = { "gofmt", "goimports" },
					vue = { "prettier" },
					sh = { "shfmt" },
					json = { { "prettier_d", "prettier" } },
					css = { { "prettier_d", "prettier" } },
					lua = { "stylua" },
					tex = { "latexindent" },
					javascript = { { "prettier_d", "prettier" } },
					markdown = { { "prettier_d", "prettier" } },
					yaml = { { "prettier_d", "prettier" } },
					toml = { { "prettier_d", "prettier" } },
				},
			})
		end,
	},
}

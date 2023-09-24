return {
	-- auto completion
	{
		"hrsh7th/nvim-cmp",
		version = false,
		event = "InsertEnter",
		dependencies = {
			"onsails/lspkind-nvim",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-nvim-lsp-signature-help",
			"hrsh7th/cmp-vsnip",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-calc",
			"hrsh7th/cmp-emoji",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-buffer",
			"hrsh7th/vim-vsnip",
		},
		opts = function()
			local cmp = require("cmp")
			return {
				completion = {
					completeopt = "menu,menuone,noinsert",
				},
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
					["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
					["<S-CR>"] = cmp.mapping.confirm({
						behavior = cmp.ConfirmBehavior.Replace,
						select = true,
					}), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				}),
				sources = cmp.config.sources({
					{ name = "path" },
					{ name = "nvim_lsp" },
					-- { name = "nvim_lsp_signature_help" },
					{ name = "nvim_lua", keyword_length = 2 },
					{ name = "buffer", keyword_length = 2 },
					{ name = "vsnip", keyword_length = 2 },
					{ name = "calc" },
					{ name = "emoji" },
					{ name = "luasnip" },
				}),
				-- formatting for the completion menu
				formatting = {
					format = function(entry, vim_item)
						-- fancy icons and a name of kind
						vim_item.kind = require("lspkind").presets.default[vim_item.kind] .. " " .. vim_item.kind

						-- set a name for each source
						vim_item.menu = ({
							nvim_lsp = "[LSP]",
							nvim_lua = "[Lua]",
							-- nvim_lsp_signature_help = "[LSP Signature Help]",
							buffer = "[Buffer]",
							vsnip = "[Vsnip]",
							luasnip = "[Luasnip]",
							path = "[Path]",
							calc = "[Calc]",
							emoji = "[Emoji]",
						})[entry.source.name]
						return vim_item
					end,
				},
				experimental = {
					ghost_text = {
						hl_group = "LspCodeLens",
					},
				},
			}
		end,
	},

	{
		"windwp/nvim-autopairs",
		event = "VeryLazy",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	},
}

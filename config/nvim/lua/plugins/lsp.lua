return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		-- event = "VeryLazy",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		opts = {
			setup = {},
		},
    -- stylua: ignore
    keys = {
      { "gd",         "<cmd>lua vim.lsp.buf.definition()<CR>" },
      { "gD",         "<cmd>lua vim.lsp.buf.declaration()<CR>" },
      { "gr",         "<cmd>lua vim.lsp.buf.references()<CR>" },
      { "gi",         "<cmd>lua vim.lsp.buf.implementation()<CR>" },
      { "K",          "<cmd>lua vim.lsp.buf.hover()<CR>" },
      { "<leader>ls",      "<cmd>lua vim.lsp.buf.signature_help()<CR>" },
      { "<leader>ld", "<cmd>lua vim.diagnostic.open_float()<CR>" },
      { "<leader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>" },
      { "<leader>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>" },
      { "<leader>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>" },
      { "<leader>D",  "<cmd>lua vim.lsp.buf.type_definition()<CR>" },
      { "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>" },
      { "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>" },
      { "gr",         "<cmd>lua vim.lsp.buf.references()<CR>" },
      { "[d",         "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>" },
      { "]d",         "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>" },
      { "<leader>lf", "<cmd>lua vim.lsp.buf.format()<CR>" },
    },
		config = function()
			local lspconfig = require("lspconfig")
			-- require("mason").setup()
			require("mason-lspconfig").setup()

			require("mason-lspconfig").setup_handlers({
				function(server_name) -- default handler (optional)
					require("lspconfig")[server_name].setup({})
				end,

				-- Next, you can provide a dedicated handler for specific servers.
				-- ["pyright"] = function()
				-- 	local util = require("lspconfig/util")
				-- 	lspconfig.pyright.setup({
				-- 		cmd = { "pyright-langserver", "--stdio" },
				-- 		filetypes = { "python" },
				-- 		root_dir = function(fname)
				-- 			return util.root_pattern(
				-- 				"requirements.txt",
				-- 				"Makefile",
				-- 				"pyproject.toml",
				-- 				"setup.py",
				-- 				"setup.cfg",
				-- 				".git"
				-- 			)(fname) or util.path.dirname(fname)
				-- 		end,
				-- 		settings = {
				-- 			python = {
				-- 				analysis = {
				-- 					typeCheckingMode = "on",
				-- 					autoSearchPaths = true,
				-- 					useLibraryCodeForTypes = true,
				-- 				},
				-- 			},
				-- 		},
				-- 	})
				-- end,
			})
		end,
	},

	-- mason
	{
		"williamboman/mason.nvim",
		cmd = "Mason",
		opts = {
			ensure_installed = {
				"stylua",
				"shfmt",
				"bash-language-server",
				"clangd",
				"cmake-language-server",
				"css-lsp",
				"dockerfile-language-server",
				"docker-compose-language-service",
				"gopls",
				"html-lsp",
				"fixjson",
				"pyright",
				"rust-analyzer",
				"lua-language-server",
				"flake8",
				"black",
			},
		},
		config = function(_, opts)
			require("mason").setup(opts)
			local mr = require("mason-registry")
			local function ensure_installed()
				for _, tool in ipairs(opts.ensure_installed) do
					local p = mr.get_package(tool)
					if not p:is_installed() then
						p:install()
					end
				end
			end
			if mr.refresh then
				mr.refresh(ensure_installed)
			else
				ensure_installed()
			end
		end,
	},

	{
		"ray-x/lsp_signature.nvim",
		event = "VeryLazy",
		opts = {},
		config = function(_, opts)
			require("lsp_signature").setup(opts)
		end,
	},
}

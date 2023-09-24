return {
	-- telescope
	{
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		dependencies = {
			"nvim-lua/popup.nvim",
			"nvim-lua/plenary.nvim",
		},
		keys = {
			{
				"<leader><space>",
				"<cmd>Telescope find_files cwd=" .. vim.fn.systemlist("git rev-parse --show-toplevel")[1] .. "<cr>",
				desc = "Find Files (root dir)",
			},
			{ "<leader>/", "<cmd>Telescope live_grep<cr>", desc = "Grep (root dir)" },
			{ "<leader>,", "<cmd>Telescope buffers show_all_buffers=true<cr>", desc = "Switch Buffer" },
			{ "<leader>:", "<cmd>Telescope command_history<cr>", desc = "Command History" },

			-- find
			{
				"<leader>ff",
				"<cmd>Telescope find_files cwd=" .. vim.fn.systemlist("git rev-parse --show-toplevel")[1] .. "<cr>",
				desc = "Find Files (root dir)",
			},
			{
				"<leader>fF",
				"<cmd>Telescope find_files<cr>",
				desc = "Find Files (CWD)",
			},
			{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
			{ "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent" },
			{
				"<leader>fR",
				"<cmd>Telescope oldfiles cwd=" .. vim.fn.systemlist("git rev-parse --show-toplevel")[1] .. "<cr>",
				desc = "Recent (root dir)",
			},

			-- search
			{ "<leader>sg", "<cmd>Telescope live_grep<cr>", desc = "Grep (root dir)" },
			{ "<leader>sG", "<cmd>Telescope live_grep cwd=false<cr>", desc = "Grep (cwd)" },
			{ "<leader>sa", "<cmd>Telescope autocommands<cr>", desc = "Auto Commands" },
			{ "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Buffer" },
			{ "<leader>sc", "<cmd>Telescope command_history<cr>", desc = "Command History" },
			{ "<leader>sC", "<cmd>Telescope commands<cr>", desc = "Commands" },
			{ "<leader>sd", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "Document diagnostics" },
			{ "<leader>sD", "<cmd>Telescope diagnostics<cr>", desc = "Workspace diagnostics" },
			{ "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Help Pages" },
			{ "<leader>sH", "<cmd>Telescope highlights<cr>", desc = "Search Highlight Groups" },
			{ "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Key Maps" },
			{ "<leader>sM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },
			{ "<leader>sm", "<cmd>Telescope marks<cr>", desc = "Jump to Mark" },
			{ "<leader>so", "<cmd>Telescope vim_options<cr>", desc = "Options" },
			{ "<leader>sR", "<cmd>Telescope resume<cr>", desc = "Resume" },
			{ "<leader>sw", "<cmd>Telescope grep_string<cr>", desc = "Word (root dir)" },
			{ "<leader>sW", "<cmd>Telescope grep_string cwd=false<cr>", desc = "Word (cwd)" },
			{ "<leader>uc", "<cmd>Telescope colorscheme enable_preview=true<cr>", desc = "Colorscheme with preview" },

			-- git
			{ "<leader>gc", "<cmd>Telescope git_commits<CR>", desc = "commits" },
			{ "<leader>gs", "<cmd>Telescope git_status<CR>", desc = "status" },

			-- Goto
			{
				"gd",
				"<cmd>Telescope lsp_definitions<cr>",
				desc = "Goto Definition",
			},
			{
				"gr",
				"<cmd>Telescope lsp_references<cr>",
				desc = "Goto References",
			},
			{
				"gI",
				"<cmd>Telescope lsp_implementations<cr>",
				desc = "Goto Implementation",
			},
			{
				"gt",
				"<cmd>Telescope lsp_type_definitions<cr>",
				desc = "Goto Type Definition",
			},
		},
		config = function()
			require("telescope").setup({})
		end,
	},

	-- which-key
	{
		"folke/which-key.nvim",
		-- enabled = false,
		event = "VeryLazy",
		opts = {
			plugins = { spelling = true },
		},
		config = function(_, opts)
			local wk = require("which-key")
			wk.setup(opts)
			local keymaps = {
				mode = { "n", "v" },
				["g"] = { name = "+goto" },
				["<leader>t"] = { name = "+terminal" },
				["<leader>s"] = { name = "+search" },
				["<leader>f"] = { name = "+file/find" },
				["<leader>l"] = { name = "+LSP" },
				["gz"] = { name = "+surround" },
				["]"] = { name = "+next" },
				["["] = { name = "+prev" },
				["<leader><tab>"] = { name = "+tabs" },
				["<leader>b"] = { name = "+buffer" },
				["<leader>c"] = { name = "+Code" },
				["<leader>g"] = { name = "+git" },
				["<leader>gh"] = { name = "+hunks" },
				["<leader>q"] = { name = "+quit/session" },
				["<leader>u"] = { name = "+ui" },
				["<leader>w"] = { name = "+windows" },
				["<leader>x"] = { name = "+diagnostics/quickfix" },
			}
			wk.register(keymaps)
		end,
	},

	-- toggleterm
	{
		"akinsho/toggleterm.nvim",
		cmd = "ToggleTerm",
		-- version = "*",
		opts = {
			size = 10,
			open_mapping = [[<c-\>]],
			shading_factor = 2,
			direction = "float",
			float_opts = {
				border = "curved",
				highlights = {
					border = "Normal",
					background = "Normal",
				},
			},
		},
		keys = {
			{
				"<C-\\>",
				"<cmd>ToggleTerm<cr>",
				desc = "ToggleTerm",
			},
			{
				"<leader>tf",
				"<cmd>ToggleTerm direction=float<cr>",
				desc = "ToggleTerm float",
			},
			{
				"<leader>th",
				"<cmd>ToggleTerm ,size = 10, direction=horizontal<cr>",
				desc = "ToggleTerm horizontal",
			},
			{
				"<leader>tv",
				"<cmd>ToggleTerm ,size = 80,direction=vertical<cr>",
				desc = "ToggleTerm vertical",
			},
			{ "<esc><esc>", "<c-\\><c-n>", { desc = "Enter Normal Mode" } },
		},
	},

	-- cursor to last place
	{
		"ethanholz/nvim-lastplace",
		opt = {
			lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
			lastplace_ignore_filetype = { "gitcommit", "gitrebase", "svn", "hgcommit" },
			lastplace_open_folds = true,
		},
		config = function()
			require("nvim-lastplace").setup(opt)
		end,
	},

	{
		"h-hg/fcitx.nvim",
		event = "InsertEnter",
	},

	-- comment
	{ "JoosepAlviste/nvim-ts-context-commentstring", lazy = true },
	{
		"echasnovski/mini.comment",
		event = "VeryLazy",
		opts = {
			mappings = {
				comment = "<C-/>",
				comment_line = "<C-/>",
				textobject = "<C-/>",
			},
			hooks = {
				pre = function()
					require("ts_context_commentstring.internal").update_commentstring({})
				end,
			},
		},
		config = function(_, opts)
			require("mini.comment").setup(opts)
		end,
	},

	{
		"karb94/neoscroll.nvim",
		config = function()
			require("neoscroll").setup({
				-- All these keys will be mapped to their corresponding default scrolling animation
				mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-y>", "<C-e>", "zt", "zz", "zb" },
				hide_cursor = false, -- Hide cursor while scrolling
				stop_eof = true, -- Stop at <EOF> when scrolling downwards
				use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
				respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
				cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
				easing_function = nil, -- Default easing function
				pre_hook = nil, -- Function to run before the scrolling animation starts
				post_hook = nil, -- Function to run after the scrolling animation ends
			})
		end,
	},

	-- file explorer
	{
		"nvim-neo-tree/neo-tree.nvim",
		cmd = "Neotree",
		keys = {
			{
				"<leader>e",
				function()
					require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
				end,
				desc = "Explorer NeoTree (cwd)",
			},
		},
		deactivate = function()
			vim.cmd([[Neotree close]])
		end,
		init = function()
			if vim.fn.argc() == 1 then
				local stat = vim.loop.fs_stat(vim.fn.argv(0))
				if stat and stat.type == "directory" then
					require("neo-tree")
				end
			end
		end,
		opts = {
			sources = { "filesystem", "buffers", "git_status", "document_symbols" },
			open_files_do_not_replace_types = { "terminal", "Trouble", "qf", "Outline" },
			filesystem = {
				bind_to_cwd = false,
				follow_current_file = { enabled = true },
				use_libuv_file_watcher = true,
			},
			window = {
				mappings = {
					["<space>"] = "none",
				},
			},
			default_component_configs = {
				indent = {
					with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
					expander_collapsed = "",
					expander_expanded = "",
					expander_highlight = "NeoTreeExpander",
				},
				name = {
					trailing_slash = false,
					use_git_status_colors = false,
					highlight = "NeoTreeFileName",
				},
				git_status = {
					symbols = {
						-- Change type
						added = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
						modified = "", -- or "", but this is redundant info if you use git_status_colors on the name
						deleted = "✖", -- this can only be used in the git_status source
						renamed = "󰁕", -- this can only be used in the git_status source
						-- Status type
						untracked = "",
						ignored = "",
						unstaged = "󰄱",
						staged = "",
						conflict = "",
					},
				},
			},
		},
		config = function(_, opts)
			require("neo-tree").setup(opts)
			vim.api.nvim_create_autocmd("TermClose", {
				pattern = "*lazygit",
				callback = function()
					if package.loaded["neo-tree.sources.git_status"] then
						require("neo-tree.sources.git_status").refresh()
					end
				end,
			})
		end,
	},

	{
		"nvim-tree/nvim-tree.lua",
		cmd = { "NvimTreeToggle", "NvimTreeOpen" },
		enabled = false,
		keys = {
			{ "<leader>e", "<cmd>NvimTreeToggle<CR>", desc = "NvimTree Toggle" },
			{ "<leader>o", "<cmd>NvimTreeFocus<CR>", desc = "NvimTree Focus" },
		},
		opts = {
			view = {
				width = 30,
			},
			on_attach = function(bufnr)
				local api = require("nvim-tree.api")

				local function opts(desc)
					return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
				end

				-- default mappings
				api.config.mappings.default_on_attach(bufnr)

				-- custom mappings
				vim.keymap.set("n", "<C-t>", api.tree.change_root_to_parent, opts("Up"))
				vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
			end,
		},
		config = function(_, opts)
			-- disable netrw at the very start of your init.lua (strongly advised)
			vim.g.loaded_netrw = 1
			vim.g.loaded_netrwPlugin = 1
			highlight = vim.api.nvim_set_hl
			highlight(0, "NvimTreeIndentMarker", { fg = "#3FC5FF" })

			require("nvim-tree").setup(opts)
		end,
	},

	-- code outline
	{
		"stevearc/aerial.nvim",
		-- cmd = { "AerialToggle", "AerialOpen" },
		keys = {
			{ "<leader>o", "<cmd>AerialToggle<CR>", desc = "Aerial Toggle" },
		},
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("aerial").setup()
		end,
	},

	-- trouble.nvim
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {},
	},

	-- todo comments
	{
		"folke/todo-comments.nvim",
		cmd = { "TodoTrouble", "TodoTelescope" },
		event = { "BufReadPost", "BufNewFile" },
		config = true,
    -- stylua: ignore
    keys = {
      { "]t",         function() require("todo-comments").jump_next() end, desc = "Next todo comment" },
      { "[t",         function() require("todo-comments").jump_prev() end, desc = "Previous todo comment" },
      { "<leader>xt", "<cmd>TodoTrouble<cr>",                              desc = "Todo (Trouble)" },
      { "<leader>xT", "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr>",      desc = "Todo/Fix/Fixme (Trouble)" },
      { "<leader>st", "<cmd>TodoTelescope<cr>",                            desc = "Todo" },
      { "<leader>sT", "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>",    desc = "Todo/Fix/Fixme" },
    },
	},

	-- joshuto
	{
		"theniceboy/joshuto.nvim",
	},

	-- code runner
	{
		"CRAG666/code_runner.nvim",
		opts = {},
		keys = {
			{ "<leader>rr", ":RunCode<CR>", desc = "Run code" },
			{ "<leader>rc", ":RunClose<CR>", desc = "Close code-runner" },
		},
		config = function(_, opts)
			require("code_runner").setup(opts)
		end,
	},

	{
		"RRethy/vim-illuminate",
		event = { "BufReadPost", "BufNewFile" },
		enabled = false,
		opts = {
			delay = 200,
			large_file_cutoff = 2000,
			large_file_overrides = {
				providers = { "lsp" },
			},
		},
		config = function(_, opts)
			require("illuminate").configure(opts)

			local function map(key, dir, buffer)
				vim.keymap.set("n", key, function()
					require("illuminate")["goto_" .. dir .. "_reference"](false)
				end, { desc = dir:sub(1, 1):upper() .. dir:sub(2) .. " Reference", buffer = buffer })
			end

			map("]]", "next")
			map("[[", "prev")

			-- also set it after loading ftplugins, since a lot overwrite [[ and ]]
			vim.api.nvim_create_autocmd("FileType", {
				callback = function()
					local buffer = vim.api.nvim_get_current_buf()
					map("]]", "next", buffer)
					map("[[", "prev", buffer)
				end,
			})
		end,
		keys = {
			{ "]]", desc = "Next Reference" },
			{ "[[", desc = "Prev Reference" },
		},
	},
}

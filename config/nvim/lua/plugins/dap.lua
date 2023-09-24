return {
  {
    "mfussenegger/nvim-dap",
    enabled = false,
    dependencies = {
      "jay-babu/mason-nvim-dap.nvim",
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
    },
    config = function()
      require("mason").setup()
      require("mason-nvim-dap").setup({
        automatic_setup = true,
        ensure_installed = { "python", "delve" },
      })
      require("mason-nvim-dap").setup_handlers({})

      -- keybindings
      keymap = vim.keymap.set
      local opts = { noremap = true, silent = true }
      -- toggle breakpoint
      keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", opts)
      -- log point
      keymap(
        "n",
        "<leader>dl",
        "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Log point message: '))<CR>",
        opts
      )
      -- continue
      keymap("n", "<leader>dc", "<cmd>lua require'dap'.continue()<CR>", opts)
      keymap("n", "<F5>", "<cmd>lua require'dap'.continue()<CR>", opts)
      -- step over
      keymap("n", "<F10>", "<cmd>lua require'dap'.step_over()<CR>", opts)
      -- step into
      keymap("n", "<F11>", "<cmd>lua require'dap'.step_into()<CR>", opts)
      -- step out
      keymap("n", "<F12>", "<cmd>lua require'dap'.step_out()<CR>", opts)
      -- open repl
      keymap("n", "<leader>do", "<cmd>lua require'dap'.repl.open()<CR>", opts)
      keymap("n", "<F6>", "<cmd>lua require'dap'.repl.open()<CR>", opts)
    end,
  },
}

local function vim_opt_toggle(user_opt, first, second)
  if first == nil then
    first = true
  end
  if second == nil then
    second = false
  end
  if vim.o[user_opt] == first then
    vim.opt[user_opt] = second
  else
    vim.opt[user_opt] = first
  end
end

return {
  n = {
    ["<C-\\>"] = { "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" },
    -- ["<leader>lF"] = {
    --   function()
    --     vim.api.nvim_del_augroup_by_name "format_on_save"
    --   end,
    --   desc = "Disable Format on Save",
    -- },
    -- ["<leader><cr>"] = { '<esc>/<++><cr>"_c4l', desc = "Next Template" },
    -- ["<leader>q"] = { ":Bdelete<cr>", desc = "Quit Buffer" },
    -- ["<leader>fh"] = false,
    -- ["<leader>u"] = false,
    -- ["<leader>o"] = false,
    -- ["<F9>"] = {
    --   function()
    --     require("dap").toggle_breakpoint()
    --   end,
    --   desc = "Toggle Breakpoint",
    -- },
    -- ["<leader>xb"] = {
    --   function()
    --     require("dap").set_breakpoint(vim.fn.input "Breakpoints condition: ")
    --   end,
    --   desc = "Breakpoint with condition",
    -- },
    -- ["<leader>xc"] = {
    --   function()
    --     require("dap").clear_breakpoints()
    --   end,
    --   desc = "Clear Breakpoints",
    -- },
    -- ["<F10>"] = {
    --   function()
    --     require("dap").continue()
    --   end,
    --   desc = "Continue",
    -- },
    -- ["<F11>"] = {
    --   function()
    --     require("dap").step_into()
    --   end,
    --   desc = "Step Into",
    -- },
    -- ["<F12>"] = {
    --   function()
    --     require("dap").step_over()
    --   end,
    --   desc = "Step Over",
    -- },
    -- ["<leader>xq"] = {
    --   function()
    --     require("dap").close()
    --     require("dapui").close()
    --   end,
    --   desc = "Close Session",
    -- },
    -- ["<leader>xQ"] = {
    --   function()
    --     require("dap").terminate()
    --     require("dapui").close()
    --   end,
    --   desc = "Terminate",
    -- },
    -- ["<leader>xu"] = {
    --   function()
    --     require("dapui").toggle()
    --   end,
    --   desc = "Toggle Debugger UI",
    -- },
    -- ["<leader>fdc"] = {
    --   function()
    --     require("telescope").extensions.dap.commands {}
    --   end,
    --   desc = "Commands",
    -- },
    -- ["<leader>fdC"] = {
    --   function()
    --     require("telescope").extensions.dap.configurations {}
    --   end,
    --   desc = "Configurations",
    -- },
    -- ["<leader>fdb"] = {
    --   function()
    --     require("telescope").extensions.dap.list_breakpoints {}
    --   end,
    --   desc = "Breakpoints",
    -- },
    -- ["<leader>fdv"] = {
    --   function()
    --     require("telescope").extensions.dap.variables {}
    --   end,
    --   desc = "Variables",
    -- },
    -- ["<leader>fdf"] = {
    --   function()
    --     require("telescope").extensions.dap.frames {}
    --   end,
    --   desc = "Frames",
    -- },
    -- ["<leader>fz"] = {
    --   function()
    --     require("telescope").extensions.zoxide.list {}
    --   end,
    --   desc = "Zoxide",
    -- },
    -- ["<leader>pp"] = {
    --   function()
    --     require("telescope").extensions.packer.packer()
    --   end,
    --   desc = "Packer Search",
    -- },
  },
  -- v = {
  --   ["<A-j>"] = { ":m '>+1<cr>gv=gv" },
  --   ["<A-k>"] = { ":m '<-2<cr>gv=gv" },
  --   J = {
  --     function()
  --       require("syntax-tree-surfer").surf("next", "visual")
  --     end,
  --     desc = "Next",
  --   },
  --   K = {
  --     function()
  --       require("syntax-tree-surfer").surf("prev", "visual")
  --     end,
  --     desc = "Prev",
  --   },
  --   H = {
  --     function()
  --       require("syntax-tree-surfer").surf("parent", "visual")
  --     end,
  --     desc = "Parent",
  --   },
  --   L = {
  --     function()
  --       require("syntax-tree-surfer").surf("child", "visual")
  --     end,
  --     desc = "Child",
  --   },
  --   ["<C-j>"] = {
  --     function()
  --       require("syntax-tree-surfer").surf("next", "visual", true)
  --     end,
  --     desc = "Swap Next",
  --   },
  --   ["<C-k>"] = {
  --     function()
  --       require("syntax-tree-surfer").surf("prev", "visual", true)
  --     end,
  --     desc = "Swap Prev",
  --   },
  -- },
  -- i = {
  --   ["<C-S>"] = { "<Esc>:w<cr>i", desc = "Save the file" },
  -- },
  t = {
    ["<C-\\>"] = { "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" },
  },
}

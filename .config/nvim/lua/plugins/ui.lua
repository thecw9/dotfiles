return {
  -- transparent
  {
    "xiyaowong/transparent.nvim",
    enabled = true,
    config = function()
      require("transparent").setup()
    end,
  },
}

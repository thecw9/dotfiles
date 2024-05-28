-- if true then return {} end

return {
  -- colorschemes
  { "EdenEast/nightfox.nvim" },
  { "navarasu/onedark.nvim" },
  { "sainnhe/everforest" },
  { "sainnhe/gruvbox-material" },
  { "rebelot/kanagawa.nvim" },
  { "ellisonleao/gruvbox.nvim" },
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  { "RRethy/nvim-base16" },
  { "sainnhe/edge" },
  { "folke/tokyonight.nvim" },
  { "projekt0n/github-nvim-theme" },
  { "folke/tokyonight.nvim", opts = { style = "moon" } },
  { "catppuccin/nvim", name = "catppuccin" },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "base16-da-one-sea",
    },
  },
}

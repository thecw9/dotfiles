local function set_theme(theme)
  vim.cmd.colorscheme(theme)
  vim.opt.termguicolors = true

  local hightlight = vim.api.nvim_set_hl
  hightlight(0, "LineNr", { fg = "#aaabab" })
  -- hightlight(0, "CursorLineNr", { bg = "#a0b0a0", fg = "#ffffff" })
  hightlight(0, "Comment", { fg = "#7faa90" })
  -- hightlight(0, "Visual", { bg = "#555577" })
  hightlight(0, "MatchParen", { bg = "green" })
  -- hightlight(0, "Normal", { bg = "none" })
  -- hightlight(0, "NormalFloat", { bg = "none" })
  -- hightlight(0, "StatusLine", { bg = "#ff6077", fg = "#000000" })
  -- hightlight(0, "Pmenu", { bg = "#504945", fg = "#ebdbb2" })
  -- hightlight(0, "PmenuSel", { bg = "#83a598", fg = "#504945" })
end

return {

  { "EdenEast/nightfox.nvim" },
  { "navarasu/onedark.nvim" },
  { "sainnhe/everforest" },
  { "sainnhe/gruvbox-material" },
  {
    "RRethy/nvim-base16",
    config = function()
      -- set_theme("base16-gruvbox-dark-medium")
      set_theme("base16-da-one-sea")
    end,
  },
  {
    "sainnhe/sonokai",
    -- config = function()
    --   set_theme("sonokai")
    -- end,
  },
  { "sainnhe/edge" },
  { "folke/tokyonight.nvim" },
  {
    "projekt0n/github-nvim-theme",
    -- config = function()
    --   set_theme("github_dark")
    -- end,
  },

  -- tokyonight
  {
    "folke/tokyonight.nvim",
    opts = { style = "moon" },
    -- config = function()
    --   set_theme("tokyonight")
    -- end,
  },

  -- catppuccin
  {
    "catppuccin/nvim",
    name = "catppuccin",
  },
}

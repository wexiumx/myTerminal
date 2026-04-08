return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "macchiato",
      transparent_background = true,
      integrations = {
        native_lsp = { enabled = true },
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
  -- Clear terminal highlight groups after colorscheme loads
  {
    "catppuccin/nvim",
    config = function(_, opts)
      require("catppuccin").setup(opts)
      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "*",
        callback = function()
          vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
          vim.api.nvim_set_hl(0, "NormalNC", { bg = "NONE" })
          vim.api.nvim_set_hl(0, "TermNormal", { bg = "NONE" })
          vim.api.nvim_set_hl(0, "TermNormalNC", { bg = "NONE" })
        end,
      })
    end,
  },
}

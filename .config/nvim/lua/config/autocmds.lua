vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "catppuccin*",
  callback = function()
    vim.api.nvim_set_hl(0, "Normal", { bg = "NONE", fg = "#cdd6f4" })
    vim.api.nvim_set_hl(0, "NormalNC", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "TermNormal", { bg = "NONE" })
  end,
})

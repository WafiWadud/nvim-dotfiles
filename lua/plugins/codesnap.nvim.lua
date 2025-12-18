local disabled = true
if disabled then
  return {}
end
return {
  "mistricky/codesnap.nvim",
  build = "make",
  keys = {
    { "<leader>cC", "<cmd>CodeSnap<cr>", mode = "x", desc = "Save selected code snapshot into clipboard" },
    { "<leader>cS", "<cmd>CodeSnapSave<cr>", mode = "x", desc = "Save selected code snapshot in ~/Pictures" },
  },
  opts = {
    save_path = "~/Pictures",
    has_breadcrumbs = true,
    has_line_number = true,
    watermark = "",
    bg_theme = "grape",
  },
}

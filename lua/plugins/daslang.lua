return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  lazy = false,

  config = function()
    require("nvim-treesitter").setup({
      local_parsers = {
        daslang = {
          source = {
            type = "local",
            path = vim.fn.expand("~/coding/daslang/tree-sitter-daslang"),
            queries_path = "queries",
          },
          filetypes = { "das" },
        },
      },
    })

    vim.filetype.add({
      extension = {
        das = "das",
      },
    })

    vim.treesitter.language.register("daslang", { "das" })

    vim.api.nvim_create_autocmd("FileType", {
      pattern = "das",
      callback = function()
        vim.treesitter.start()
      end,
    })

    vim.lsp.config("daslang", {
      cmd = {
        "python3",
        vim.fn.expand("~/coding/daslang/utils/lsp/lsp_supervisor.py"),
      },
      filetypes = { "das" },
      root_markers = { ".git", ".das_project" },

      init_options = {
        compiler = vim.fn.expand("~/coding/daslang/bin/daslang"),
      },
    })

    vim.lsp.enable("daslang")
  end,
}

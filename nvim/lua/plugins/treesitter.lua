return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
  opts = {
    ensure_installed = {
      "lua",
      "vim",
      "vimdoc",
      "query",
      "javascript",
      "typescript",
      "tsx",
      "php",
      "c_sharp",
      "blade",
      "astro",
      "dart",
      "html",
      "css",
      "json",
      "bash",
      "yaml",
      "markdown",
      "markdown_inline",
    },
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    indent = { enable = true },
  },
  config = function(_, opts)
    local ok_parsers, parsers = pcall(require, "nvim-treesitter.parsers")
    if ok_parsers then
      parsers.blade = {
        install_info = {
          url = "https://github.com/EmranMR/tree-sitter-blade",
          files = { "src/parser.c" },
          branch = "main",
        },
        filetype = "blade",
      }
    end

    local ok, configs = pcall(require, "nvim-treesitter.configs")
    if not ok then
      return
    end

    configs.setup(opts)
  end,
}

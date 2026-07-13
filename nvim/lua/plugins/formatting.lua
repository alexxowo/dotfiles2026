return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      "<leader>f",
      -- Cambiado de <leader>f a una combinación que no colisione (como <leader>fm o simplemente <leader>f)
      -- En keymaps.lua no hay colisión con <leader>f
      function()
        require("conform").format({ async = true, lsp_fallback = true })
      end,
      mode = "",
      desc = "Formatear buffer",
    },
  },
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      php = { "pint" },
      javascript = { "prettierd", "prettier", stop_after_first = true },
      typescript = { "prettierd", "prettier", stop_after_first = true },
      javascriptreact = { "prettierd", "prettier", stop_after_first = true },
      typescriptreact = { "prettierd", "prettier", stop_after_first = true },
      json = { "prettierd", "prettier", stop_after_first = true },
      html = { "prettier", stop_after_first = true },
      css = { "prettier", stop_after_first = true },
      blade = { "blade-formatter" },
      cs = { "csharpier" },
      astro = { "prettierd", "prettier", stop_after_first = true },
    },
    format_on_save = {
      timeout_ms = 1000, -- 1 segundo es más seguro para proyectos grandes
      lsp_fallback = true,
    },
  },
}

return {
  {
    "williamboman/mason.nvim",
    config = true,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    opts = {
      ensure_installed = {
        "intelephense", -- PHP
        "ts_ls",        -- TypeScript / JS / React
        "tailwindcss",  -- Tailwind CSS
        "html",         -- HTML
        "cssls",        -- CSS
        "lua_ls",       -- Lua
        "omnisharp",    -- C#
        "astro",        -- Astro
        "jdtls",        -- Java
        "spring-boot-ls", -- Spring Boot
        "dockerls",     -- Dockerfile
        "docker_compose_language_service", -- Docker Compose
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "Saghen/blink.cmp",
    },
    config = function()
      -- Carga las configuraciones predefinidas de nvim-lspconfig en la API nativa de Neovim
      require("lspconfig")

      local capabilities = require("blink.cmp").get_lsp_capabilities()

      local servers = {
        "intelephense",
        "ts_ls",
        "tailwindcss",
        "html",
        "cssls",
        "lua_ls",
        "omnisharp",
        "astro",
        "jdtls",
        "spring_boot",
        "dockerls",
        "docker_compose_language_service",
      }

      -- 1. Modificar y aplicar capacidades personalizadas usando la API nativa
      vim.lsp.config("lua_ls", {
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
              checkThirdParty = false,
            },
            telemetry = {
              enable = false,
            },
          },
        },
      })

      vim.lsp.config("intelephense", {
        capabilities = capabilities,
        settings = {
          intelephense = {
            files = {
              maxSize = 5000000,
            },
          },
        },
      })

      -- Aplicar capacidades por defecto para el resto de los servidores
      for _, server in ipairs({
        "ts_ls",
        "tailwindcss",
        "html",
        "cssls",
        "omnisharp",
        "astro",
        "jdtls",
        "spring_boot",
        "dockerls",
        "docker_compose_language_service",
      }) do
        vim.lsp.config(server, {
          capabilities = capabilities,
        })
      end

      -- 2. Habilitar todos los servidores de manera nativa (API de Neovim 0.11+)
      vim.lsp.enable(servers)
    end,
  },
}

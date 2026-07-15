return {
  "adalessa/laravel.nvim",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-neotest/nvim-nio",
  },
  cond = function()
    -- Solo cargar el plugin si estamos dentro de un proyecto Laravel real
    -- (buscando el archivo 'artisan' de forma ascendente desde el archivo actual)
    local path = vim.fn.expand("%:p:h")
    if path == "" then
      path = vim.fn.getcwd()
    end
    return vim.fs.find({ "artisan" }, { upward = true, path = path })[1] ~= nil
  end,
  ft = { "php", "blade" },
  event = { "BufEnter composer.json" },
  keys = {
    { "<leader>ll", function() Laravel.pickers.laravel() end,            desc = "Laravel: Picker" },
    { "<leader>la", function() Laravel.pickers.artisan() end,            desc = "Laravel: Artisan Picker" },
    { "<leader>lr", function() Laravel.pickers.routes() end,             desc = "Laravel: Routes Picker" },
    { "<leader>lm", function() Laravel.pickers.make() end,               desc = "Laravel: Make Picker" },
    { "<leader>lc", function() Laravel.pickers.commands() end,           desc = "Laravel: Custom Commands Picker" },
    { "<leader>lo", function() Laravel.pickers.resources() end,          desc = "Laravel: Resources Picker" },
    { "<leader>lh", function() Laravel.run("artisan docs") end,          desc = "Laravel: Documentation" },
    { "<leader>lt", function() Laravel.commands.run("actions") end,      desc = "Laravel: Code Actions" },
    { "<leader>lu", function() Laravel.commands.run("hub") end,          desc = "Laravel: Artisan Hub" },
    { "<leader>lp", function() Laravel.commands.run("command_center") end, desc = "Laravel: Command Center" },
    { "<c-g>",      function() Laravel.commands.run("view:finder") end,  desc = "Laravel: View Finder" },
    { "<leader>gv", function() Laravel.commands.run("gf") end,           desc = "Laravel: Ir a la vista/recurso" },
    {
      "gf",
      function()
        if Laravel.app("gf").cursorOnResource() then
          return "<cmd>lua Laravel.commands.run('gf')<cr>"
        end
        return "gf"
      end,
      expr = true, noremap = true, desc = "Laravel: Go to resource",
    },
  },
  opts = {
    features = {
      composer_info = {
        enable = false,
      },
      pickers = {
        provider = "telescope", -- telescope | fzf-lua | snacks | ui.select
      },
    },
  },
}

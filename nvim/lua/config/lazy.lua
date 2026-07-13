-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)


-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Registrar tipo de archivo para Blade (Laravel)
vim.filetype.add({
  pattern = {
    [".*%.blade%.php"] = "blade",
  },
})

-- Activar Treesitter para Blade
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = "blade",
  callback = function()
    vim.treesitter.start()
  end,
})


-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- import your plugins
    { import = "plugins" },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "nordic" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})

require("core.keymaps")
require("core.lsp")

-- Set colorscheme (Puedes cambiar "nordic" por "catppuccin" aquí para alternar)
vim.cmd("colorscheme nordic")

-- Set color theme & line options
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true

-- Autoread: recargar automáticamente archivos modificados externamente (por AGY/OpenCode)
vim.opt.autoread = true
vim.opt.updatetime = 300 -- Reducir tiempo de respuesta del editor a 300ms

-- Monitor de archivos en tiempo real (File Watcher) para refresco instantáneo
local function watch_file(bufnr)
  bufnr = bufnr or vim.api.nvim_get_current_buf()
  local filepath = vim.api.nvim_buf_get_name(bufnr)
  if filepath == "" or not vim.loop.fs_stat(filepath) then
    return
  end

  -- Evitar duplicados
  if vim.b[bufnr].file_watcher then
    vim.b[bufnr].file_watcher:stop()
  end

  local w = vim.loop.new_fs_event()
  vim.b[bufnr].file_watcher = w

  w:start(filepath, {}, vim.schedule_wrap(function(err, fname, events)
    if err then
      if vim.b[bufnr].file_watcher then
        vim.b[bufnr].file_watcher:stop()
        vim.b[bufnr].file_watcher = nil
      end
      return
    end

    -- Recargar sólo si el buffer es válido y no tiene cambios locales sin guardar
    if vim.api.nvim_buf_is_valid(bufnr) and not vim.api.nvim_get_option_value("modified", { buf = bufnr }) then
      vim.cmd("checktime " .. bufnr)
    end
  end))
end

-- Iniciar el monitor al entrar a un buffer o guardarlo
vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
  pattern = "*",
  callback = function(args)
    watch_file(args.buf)
  end,
})

-- Respaldo de seguridad en navegación
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, {
  pattern = "*",
  callback = function()
    if vim.fn.getcmdwintype() == "" then
      vim.cmd("checktime")
    end
  end,
})


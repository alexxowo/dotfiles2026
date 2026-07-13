# 🛠️ Contexto de Configuración de Neovim

Este archivo contiene la documentación estructural y de configuración de tu entorno de desarrollo personalizado de Neovim.

---

## 📂 Estructura de Directorios y Archivos

```text
~/.config/nvim/
├── init.lua                   # Punto de entrada de Neovim (Carga lazy.lua)
├── lazy-lock.json             # Versiones fijadas de los plugins instalados
├── nvim_context.md            # Este archivo de contexto y documentación
└── lua/
    ├── core/
    │   ├── keymaps.lua        # Atajos de teclado generales (Guardar, ventanas, etc.)
    │   └── lsp.lua            # Configuración de los atajos y acciones de LSP
    ├── config/
    │   └── lazy.lua           # Configuración de Lazy.nvim y opciones básicas de Vim
    └── plugins/
        ├── blink.lua          # Motor de autocompletado rápido
        ├── bufferline.lua     # Pestañas / Buffers superiores (con bufdelete)
        ├── catppuccin.lua     # Tema visual principal (Mocha flavor)
        ├── core.lua           # Plugin core opcional
        ├── formatting.lua     # Formateador de código (Conform.nvim)
        ├── gitsigns.lua       # Integración con Git (Hunks y Diffs)
        ├── harpoon.lua        # Marcado rápido de archivos preferidos
        ├── indentline.lua     # Guías de indentación visuales
        ├── laravel.nvim.lua   # Integración dedicada para Laravel (artisan, routes)
        ├── lsp.lua            # Servidores LSP (intelephense, ts_ls, omnisharp, etc.)
        ├── lualine.lua        # Barra de estado inferior estilizada
        ├── neotree.lua        # Árbol de archivos lateral
        ├── oil.lua            # Edición de directorios como buffers de texto
        ├── surround.lua       # Operaciones rápidas sobre delimitadores (comillas, paréntesis)
        ├── telescope.lua      # Buscador difuso (archivos, texto, buffers, git)
        ├── tmux.lua           # Integración de navegación con paneles Tmux
        ├── todocomments.lua   # Resaltado y búsqueda de comentarios TODO/FIXME
        └── treesitter.lua     # Resaltado de sintaxis enriquecido
```

---

## 🔌 Plugins Instalados y su Propósito

1. **`catppuccin/nvim`** ([catppuccin.lua](file:///home/alexandre/.config/nvim/lua/plugins/catppuccin.lua))
   * **Tema**: Catppuccin Mocha. Diseñado para alta legibilidad y confort visual.
2. **`neovim/nvim-lspconfig` & `williamboman/mason.nvim`** ([lsp.lua](file:///home/alexandre/.config/nvim/lua/plugins/lsp.lua))
   * **LSP**: Configuración de lenguajes. Soporta PHP (`intelephense`), JS/TS (`ts_ls`), CSS (`cssls`), Tailwind (`tailwindcss`), Lua (`lua_ls`) y C# (`omnisharp`).
3. **`stevearc/conform.nvim`** ([formatting.lua](file:///home/alexandre/.config/nvim/lua/plugins/formatting.lua))
   * **Formateo**: Ejecuta `pint` (PHP), `prettier` (JS, TS, React, HTML, CSS), `blade-formatter` (Blade) y `csharpier` (C#) de forma automática al guardar.
4. **`akinsho/bufferline.nvim` & `famiu/bufdelete.nvim`** ([bufferline.lua](file:///home/alexandre/.config/nvim/lua/plugins/bufferline.lua))
   * **Buffers**: Barra de pestañas en la parte superior. Permite cerrar buffers sin descuadrar la interfaz visual.
5. **`nvim-treesitter/nvim-treesitter`** ([treesitter.lua](file:///home/alexandre/.config/nvim/lua/plugins/treesitter.lua))
   * **Parser**: Resaltado sintáctico premium para PHP, Blade, JS, TS, TSX, C#, HTML, CSS, JSON, Markdown, etc.
6. **`adalessa/laravel.nvim`** ([laravel.nvim.lua](file:///home/alexandre/.config/nvim/lua/plugins/laravel.nvim.lua))
   * **Laravel**: Herramientas integradas para Laravel (Artisan picker, buscador de rutas, generación de código).
7. **`nvim-telescope/telescope.nvim`** ([telescope.lua](file:///home/alexandre/.config/nvim/lua/plugins/telescope.lua))
   * **Buscador**: Búsqueda global difusa de archivos, texto, buffers activos e historial de Git.
8. **`nvim-neo-tree/neo-tree.nvim`** ([neotree.lua](file:///home/alexandre/.config/nvim/lua/plugins/neotree.lua))
   * **Explorador**: Árbol de archivos lateral clásico.
9. **`stevearc/oil.nvim`** ([oil.lua](file:///home/alexandre/.config/nvim/lua/plugins/oil.lua))
   * **Explorador**: Permite interactuar con el sistema de archivos como si fuera un buffer ordinario de texto.
10. **`lewis6991/gitsigns.nvim`** ([gitsigns.lua](file:///home/alexandre/.config/nvim/lua/plugins/gitsigns.lua))
    * **Git**: Muestra líneas agregadas/modificadas y permite navegar por cambios (`]c` y `[c`).
11. **`christoomey/vim-tmux-navigator`** ([tmux.lua](file:///home/alexandre/.config/nvim/lua/plugins/tmux.lua))
    * **Tmux**: Navegación integrada con atajos `Ctrl + h/j/k/l` compartidos con los paneles de Tmux.

---

## ⚙️ Configuración del Entorno de Ejecución (Vim Options)

En [lazy.lua](file:///home/alexandre/.config/nvim/lua/config/lazy.lua) se configuran las siguientes opciones por defecto:
* `vim.g.mapleader = " "` (Espacio como tecla líder)
* `vim.g.maplocalleader = "\\"` (Local leader como backslash)
* `vim.opt.number = true` (Mostrar números de línea absolutos)
* `vim.opt.relativenumber = true` (Números relativos para facilitar saltos verticales rápidos)
* `vim.opt.cursorline = true` (Resaltar visualmente la línea actual bajo el cursor)
* Registro del tipo de archivo `.blade.php` para ser mapeado como sintaxis `blade`.
* `vim.opt.autoread = true` con autocomandos `checktime` para recargar automáticamente los cambios hechos en el disco por herramientas externas como AGY y OpenCode.

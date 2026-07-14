# 📝 Hoja de Atajos de Teclado (Cheat Sheet)

Esta guía te ayudará a recordar y acostumbrarte a los atajos de teclado configurados en tu entorno de desarrollo con **Tmux** y **Neovim**.

---

## 🪟 TMUX (Gestor de Terminales)

El prefijo principal está configurado en **`Ctrl + a`** (indicado en esta guía como `Prefix`).

### 📦 Gestión de Sesiones
* **Iniciar sesión con `nic`**: Ejecuta `nic` en tu terminal para crear/adjuntarte a una sesión con Neovim (izquierda), OpenCode (derecha superior) y terminal (derecha inferior).
* **Desconectarse de la sesión (detacher)**: `Prefix` + `d` (la sesión sigue corriendo en segundo plano).
* **Volver a conectarse**: `tmux attach`
* **Cerrar toda la sesión (desde consola inferior)**: `tmux kill-session`

### 🗂️ Paneles (Splits)
* **Dividir horizontalmente (lado a lado)**: `Prefix` + `|`
* **Dividir verticalmente (arriba y abajo)**: `Prefix` + `-`
* **Cerrar panel actual**: `Ctrl + d` (o escribe `exit` en la consola).
* **Maximizar / restaurar panel**: `Prefix` + `z` (útil si quieres agrandar temporalmente el panel inferior a pantalla completa).

### 📑 Múltiples Terminales / Ventanas (Pestañas)
Para no saturar una sola pantalla de paneles diminutos, Tmux permite tener múltiples "pestañas" (ventanas) independientes:
* **Crear nueva ventana**: `Prefix` + `c` (abre una pestaña limpia en el directorio actual).
* **Cambiar de ventana**:
  * `Prefix` + `n` : Ir a la siguiente ventana.
  * `Prefix` + `p` : Ir a la ventana anterior.
  * `Prefix` + `0` a `9` : Ir directamente al número de ventana correspondiente.
* **Renombrar ventana actual**: `Prefix` + `,` (puedes nombrarlas como `servidor`, `npm`, `workers`, `logs` para mantener la barra inferior limpia y organizada).
* **Cerrar ventana completa**: Escribe `exit` en todos los paneles de esa ventana.

### 🎯 Navegación y Redimensionado
* **Moverse entre paneles**: Mantén presionado `Alt` y usa `h` / `j` / `k` / `l` (funciona igual en Neovim y Tmux).
* **Redimensionar paneles (Mouse)**: Haz clic y arrastra el borde con el mouse (soporte de mouse habilitado).
* **Redimensionar paneles (Teclado)**: Mantén presionado `Prefix` y usa las flechas de dirección (`←`, `→`, `↑`, `↓`).

### 📋 Copiar y Pegar en Tmux
* **Método Automático (Mouse)**: Al seleccionar cualquier texto arrastrando el mouse, este se copiará automáticamente al portapapeles de tu sistema y la selección se mantendrá resaltada en pantalla.
* **Bypass de Terminal (Tecla Shift)**: Si deseas usar la selección nativa de tu terminal para copiar o hacer clic derecho, **mantén presionada la tecla `Shift`** mientras seleccionas el texto con el mouse.

---

## 💻 NEOVIM

El prefijo de Neovim (`<leader>`) está configurado como la tecla **`Espacio`**.

### 📁 Exploradores de Archivos
* **Neo-tree (Árbol lateral)**:
  * `<leader>e` : Abrir o cerrar el explorador de archivos.
  * `a` : Crear un archivo o directorio (agrega `/` al final para directorios) dentro de Neo-tree.
  * `d` : Borrar archivo.
  * `r` : Renombrar archivo.
* **Oil.nvim (Explorador tipo buffer)**:
  * `-` : Abre el directorio del archivo actual directamente en el buffer (puedes editar nombres de archivos como texto normal, guardar con `Ctrl + s` para aplicar los cambios a tu disco).
  * `<CR>` (Enter) : Entrar a una carpeta o abrir archivo.

### 🗃️ Buffers (Archivos Abiertos)
* **Ver listado de buffers activos (Telescope)**: `<leader>fb` (Espacio + f + b). Puedes buscar por nombre y presionar `Enter` para saltar a él.
* **Ciclar entre buffers**:
  * `Shift + h` : Ir al buffer anterior.
  * `Shift + l` : Ir al buffer siguiente.
* **Ir a un buffer específico**: `<leader>b1` hasta `<leader>b9` (ej. `Espacio` + `b` + `3`).
* **Cerrar buffer actual**: `<leader>bd` (gracias a `bufdelete` no alterará tu layout de ventanas).
* **Forzar cerrar buffer**: `<leader>bD`
* **Cerrar otros buffers**: `<leader>bo`

### 🔍 Telescope (Buscador Difuso)
* `<leader>ff` : Buscar archivos en el proyecto por nombre.
* `<leader>fg` : Buscar palabras (grep) en todo el código del proyecto.
* `<leader>fb` : Buscar y listar buffers abiertos (te lo menciono aquí también).
* `<leader>gs` : Ver y abrir archivos modificados por Git.
* `<leader>fh` : Buscar en la documentación de Neovim.

### 🛠️ Laravel (laravel.nvim)
* `<leader>ll` : Picker general de Laravel.
* `<leader>la` : Ejecutar comandos de Artisan interactivos.
* `<leader>lr` : Listar y filtrar rutas.
* `<leader>lm` : Picker para crear Modelos, Controladores, etc. (`make`).
* `gf` : Si estás sobre el nombre de una vista, componente, ruta o relación, te lleva al archivo correspondiente.
* `<leader>gv` : Ir directamente a la vista o recurso Laravel bajo el cursor.

### ⚙️ LSP (Acciones de Código)
* `gd` : Ir a la definición de la función/clase. **Integración inteligente con Laravel**: En archivos PHP y Blade, si estás sobre un recurso de Laravel (como una vista `view('mi.vista')` o ruta `route('mi.ruta')`), te llevará directamente al archivo de la vista o al controlador/ruta correspondiente.
* `gI` : Ir a la implementación. **Mecanismo de fallback activo**: si el servidor (como Intelephense gratuito) no soporta la consulta de implementación, ejecutará automáticamente la búsqueda de definición (`gd`) para evitar el error.
* `gr` : Ver todas las referencias del símbolo.
* `K` : Mostrar documentación del elemento bajo el cursor.
* `<leader>rn` : Renombrar variable/función en todo el proyecto.
* `<leader>ca` : Ver acciones de código sugeridas (ej. importar clase).
* `<leader>f` : Formatear el archivo actual (usa Pint para PHP, Prettier para React/JS/TS, Csharpier para C#).

### 📋 Copiar Rutas (Para pasar a AGY / OpenCode)
* **`<leader>cr`** : Copiar **ruta relativa** del archivo actual (ej. `resources/views/welcome.blade.php`) al portapapeles.
* **`<leader>crr` (Modo Normal)** : Copiar **ruta relativa con línea** actual (ej. `resources/views/welcome.blade.php#L45`) al portapapeles.
* **`<leader>crr` (Modo Visual)** : Copiar **ruta relativa con rango de líneas** seleccionadas (ej. `resources/views/welcome.blade.php#L45-L60`) al portapapeles.
* **`<leader>cp`** : Copiar **ruta absoluta** completa del archivo actual al portapapeles.

### 🌿 Git & Monitoreo de Cambios (AGY / OpenCode / Propios)
Cuando un agente (AGY u OpenCode) o tú modifican archivos, puedes usar estas herramientas integradas para ver qué cambió:
* **Telescope Git Status (`<leader>gs`)**: Muestra un listado interactivo con todos los archivos modificados o creados. Al seleccionar uno con `Enter`, Neovim lo abrirá.
* **Gitsigns (Indicadores y Blame en tiempo real)**:
  * **Git Blame en línea (Inline Blame)**: Cuando dejes el cursor sobre una línea por más de 0.5 segundos, verás un texto tenue al final de la línea indicando: `👤 Autor • 📅 Fecha • 💬 Mensaje del commit`.
  * Verás pequeños símbolos coloreados en el borde izquierdo (verde = agregado, amarillo = modificado, rojo = borrado).
  * `]c` : Saltar al siguiente cambio dentro del archivo actual.
  * `[c` : Saltar al cambio anterior.
  * `<leader>gp` : Previsualizar en una ventana flotante el cambio exacto (diff) de las líneas bajo tu cursor.
  * `<leader>gd` : Abrir una vista de comparación (diff completo) lado a lado para el archivo actual.
* **En la terminal integrada**: Puedes correr `git status` o usar `git diff` para inspeccionar detalladamente todos los cambios realizados en el proyecto.

<p align="center">
  <img class="center" width="671" height="60" alt="banner" src="https://github.com/user-attachments/assets/5670d451-62f0-4374-b2c1-0dce49472ea9" />
</p>
<p align="center">Nvim dotfiles, With <a href="https://github.com/folke/lazy.nvim">lazy.nvim</a>💤 Plugin</p>


> ## Installation


```bash
git clone https://github.com/adilhyz/nvim ~/.config/nvim && nvim
```


> [!TIP]
> Use Update after Installation


```
:Lazy sync
```
<img alt="Shot-2025-10-27-165616" src="https://github.com/user-attachments/assets/e3c8f374-464a-463f-b915-f8e2c96c1c95" />


## Keymap

### 🛖Home Keymaps


just use `nvim` on directory, no use ~`nvim ~/yourdirectory/ `~ for showing this keymaps:
|        Mode        |          Key          |         Description         |
|--------------------|-----------------------|-----------------------------|
|     **Normal**     | <kbd>&lt;C-p&gt;</kbd> | Find File                   |
|     **Normal**     | <kbd>&lt;C-n&gt;</kbd> | New File                    |
|     **Normal**     | <kbd>&lt;C-f&gt;</kbd> | Find Text                   |
|     **Normal**     | <kbd>&lt;C-.&gt;</kbd> | Show Config                 |
|     **Normal**     | <kbd>&lt;C-l&gt;</kbd> | Recent Files                |
|     **Normal**     | <kbd>L</kbd>           | Lazy                        |
|     **Normal**     | <kbd>q</kbd>           | Quit                        |


### 🧭 Navigation & File Management
|        Mode        |           Key           |             Description              |
|--------------------|-------------------------|--------------------------------------|
|     **Normal**     | <kbd>&lt;leader&gt;e</kbd>          | Toggle file explorer                 |
|     **Normal**     | <kbd>&lt;leader&gt;&lt;space&gt;</kbd> | Smart Find Files                     |
|     **Normal**     | <kbd>&lt;leader&gt;,</kbd>          | Buffers                              |
|     **Normal**     | <kbd>&lt;leader&gt;/</kbd>          | Grep                                 |
|     **Normal**     | <kbd>&lt;leader&gt;:</kbd>          | Command History                      |
|     **Normal**     | <kbd>&lt;leader&gt;fb</kbd>         | Buffers                              |
|     **Normal**     | <kbd>&lt;leader&gt;fc</kbd>         | Find Config File                     |
|     **Normal**     | <kbd>&lt;leader&gt;ff</kbd>         | Find Files                           |
|     **Normal**     | <kbd>&lt;leader&gt;fg</kbd>         | Find Git Files                       |
|     **Normal**     | <kbd>&lt;leader&gt;fp</kbd>         | Projects                             |
|     **Normal**     | <kbd>&lt;leader&gt;fr</kbd>         | Recent                               |
|     **Normal**     | <kbd>&lt;leader&gt;o</kbd>          | Convert Markdown to PDF              |
|     **Normal**     | <kbd>&lt;leader&gt;oq</kbd>         | Toggle KNAP auto-preview             |
|     **Normal**     | <kbd>&lt;C-n&gt;</kbd>              | New file                             |
|     **Normal**     | <kbd>&lt;C-.&gt;</kbd>              | Show Config                          |
|     **Normal**     | <kbd>&lt;C-p&gt;</kbd>              | Find files (including hidden)        |
|     **Normal**     | <kbd>&lt;C-f&gt;</kbd>              | Find Text                            |


### 💾 File Actions (Save, Quit, Undo, Redo)
|        Mode        |         Key          |             Description              |
|--------------------|----------------------|--------------------------------------|
|     **Normal**     | <kbd>&lt;C-s&gt;</kbd>              | Save file                            |
|     **Normal**     | <kbd>&lt;leader&gt;q</kbd>          | Quit Neovim                          |
|  `n`, `v`, `i`, `c`| <kbd>&lt;C-q&gt;</kbd>              | Quit from any mode                   |
|      `n`, `i`      | <kbd>&lt;C-z&gt;</kbd>              | Undo                                 |
|      `n`, `i`      | <kbd>&lt;C-y&gt;</kbd>              | Redo                                 |


### 📋Clipboard & Text
|        Mode        |         Key          |             Description              |
|--------------------|----------------------|--------------------------------------|
|     **Normal**     | <kbd>&lt;C-a&gt;</kbd>              | Select all text                      |
|  `n`, `v`, `i`, `c`| <kbd>&lt;C-c&gt;</kbd>              | Copy to clipboard                    |
|  `n`, `v`, `i`, `c`| <kbd>&lt;C-v&gt;</kbd>              | Paste from clipboard                 |
|  `n`, `v`, `i`, `c`| <kbd>&lt;C-x&gt;</kbd>              | Cut to clipboard                     |
|      `n`, `v`      | <kbd>&lt;C-/&gt;</kbd>              | Toggle comment                       |
|     **Normal**     | <kbd>&lt;C-h&gt;</kbd>              | Replace text (global)                |
|     **Normal**     | <kbd>&lt;C-g&gt;</kbd>              | Go to line line number(int)          |
|     **Normal**     | <kbd>&lt;C-d&gt;</kbd>              | Select next occurrence               |


### ✏️ Text Editing & Selection
|        Mode        |         Key          |             Description              |
|--------------------|----------------------|--------------------------------------|
|    `n`, `i`, `v`   | <kbd>&lt;C-S-Up&gt;</kbd>           | Duplicate line up                    |
|    `n`, `i`, `v`   | <kbd>&lt;C-S-Down&gt;</kbd>         | Duplicate line down                  |
|     **Normal**     | <kbd>&lt;A-j&gt;</kbd>              | Move line down                       |
|     **Normal**     | <kbd>&lt;A-k&gt;</kbd>              | Move line up                         |
|     **Visual**     | <kbd>&lt;A-j&gt;</kbd>              | Move selected block down             |
|     **Visual**     | <kbd>&lt;A-k&gt;</kbd>              | Move selected block up               |
|     **Visual**     | <kbd>&lt;A-/&gt;</kbd>              | Add comment                          |
|     **Visual**     | <kbd>&lt;Tab&gt;</kbd>              | Indent right                         |
|     **Visual**     | <kbd>&lt;S-Tab&gt;</kbd>            | Indent left                          |
|     **Insert**     | <kbd>&lt;S-Left&gt;</kbd>           | Select text left                     |
|     **Insert**     | <kbd>&lt;S-Right&gt;</kbd>          | Select text right                    |
|     **Insert**     | <kbd>&lt;S-Up&gt;</kbd>             | Select text up                       |
|     **Insert**     | <kbd>&lt;S-Down&gt;</kbd>           | Select text down                     |
|     **Insert**     | <kbd>&lt;S-Home&gt;</kbd>           | Select to line start                 |
|     **Insert**     | <kbd>&lt;S-End&gt;</kbd>            | Select to line end                   |
|     **Insert**     | <kbd>&lt;S-PageUp&gt;</kbd>         | Select one page up                   |
|     **Insert**     | <kbd>&lt;S-PageDown&gt;</kbd>       | Select one page down                 |


### 🪟 Window & Buffer Management
|        Mode        |         Key          |             Description              |
|--------------------|----------------------|--------------------------------------|
|     **Normal**     | <kbd>&lt;leader&gt;sv</kbd>         | Split vertically                     |
|     **Normal**     | <kbd>&lt;leader&gt;sh</kbd>         | Split horizontally                   |
|     **Normal**     | <kbd>&lt;leader&gt;se</kbd>         | Equalize split sizes                 |
|     **Normal**     | <kbd>&lt;leader&gt;sx</kbd>         | Close split                          |
|     **Normal**     | <kbd>te</kbd>                       | Edit in new tab                      |
|     **Normal**     | <kbd>&lt;C-Tab&gt;</kbd>            | Next tab                             |
|     **Normal**     | <kbd>&lt;C-S-Tab&gt;</kbd>          | Previous tab                         |
|     **Normal**     | <kbd>&lt;C-n&gt;</kbd>              | New tab                              |
|     **Normal**     | <kbd>&lt;C-w&gt;</kbd>              | Close tab                            |
|     **Normal**     | <kbd>&lt;Tab&gt;</kbd>              | Next buffer                          |
|     **Normal**     | <kbd>&lt;S-Tab&gt;</kbd>            | Previous buffer                      |
|     **Normal**     | <kbd>&lt;leader&gt;x</kbd>          | Close buffer                         |
|     **Normal**     | <kbd>&lt;A-p&gt;</kbd>              | Pin buffer                           |


### 🧩 Git Integration & LSP
|        Mode        |         Key          |             Description              |
|--------------------|----------------------|--------------------------------------|
|     **Normal**     | <kbd>&lt;leader&gt;gg</kbd>         | Lazygit                              |
|     **Normal**     | <kbd>&lt;leader&gt;gl</kbd>         | Lazygit                              |
|     **Normal**     | <kbd>&lt;leader&gt;glf</kbd>        | Lazygit Log File                     |
|     **Normal**     | <kbd>&lt;leader&gt;gb</kbd>         | Git Branches                         |
|     **Normal**     | <kbd>&lt;leader&gt;gL</kbd>         | Git Log Line                         |
|     **Normal**     | <kbd>&lt;leader&gt;gs</kbd>         | Git Status                           |
|     **Normal**     | <kbd>&lt;leader&gt;gS</kbd>         | Git Stash                            |
|     **Normal**     | <kbd>&lt;leader&gt;gd</kbd>         | Git Diff (Hunks)                     |
|     **Normal**     | <kbd>gd</kbd>                       | Goto Definition                      |
|     **Normal**     | <kbd>gD</kbd>                       | Goto Declaration                     |
|     **Normal**     | <kbd>gr</kbd>                       | References                           |
|     **Normal**     | <kbd>gI</kbd>                       | Goto Implementation                  |
|     **Normal**     | <kbd>gy</kbd>                       | Goto Type Definition                 |
|     **Normal**     | <kbd>&lt;leader&gt;ss</kbd>         | LSP Symbols                          |
|     **Normal**     | <kbd>&lt;leader&gt;sS</kbd>         | LSP Workspace Symbols                |


### 🖱️ Miscellaneous
|        Mode        |         Key          |             Description              |
|--------------------|----------------------|--------------------------------------|
|      `n`, `v`      | <kbd>&lt;RightMouse&gt;</kbd>       | Open right-click menu                |
|     **Normal**     | <kbd>&lt;C-S-`&gt;</kbd>           | Open Terminal on footer like VS Code |
|     **Normal**     | <kbd>&lt;leader&gt;td</kbd>         | To-do (Top Right)                    |
|     **Normal**     | <kbd>&lt;leader&gt;td</kbd>         | Zen Mode                             |

## Thanks To

- folke (plugin)
- gh0stzk (based)

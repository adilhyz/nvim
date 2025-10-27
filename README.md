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
<img width="800" alt="Shot-2025-10-26-200121" src="https://github.com/user-attachments/assets/8a2fa10b-c8d8-4dd4-8c1f-1906ee359ced" />


## Keymap

### 🛖Home Keymaps

just use `nvim` on directory, no use ~`nvim ~/yourdirectory/ `~ for showing this keymaps:


|        Mode        |        Key        |       Description        |
|--------------------|-------------------|---------------------------|
|     **Normal**     | `<C-p>`           | Find File                 |
|     **Normal**     | `<C-n>`           | New File                  |
|     **Normal**     | `<C-f>`           | Find Text                 |
|     **Normal**     | `<C-.>`           | Show Config               |
|     **Normal**     | `<C-l>`           | Recent Files              |
|     **Normal**     | `s`               | Restore Session           |
|     **Normal**     | `L`               | Lazy                      |
|     **Normal**     | `q`               | Quit                      |



### 🧭 Navigation & File Management
|        Mode        |         Key          |             Description              |
|--------------------|----------------------|--------------------------------------|
|     **Normal**     | `<leader>e`          | Toggle file explorer                 |
|     **Normal**     | `<leader><space>`    | Smart Find Files                     |
|     **Normal**     | `<leader>,`          | Buffers                              |
|     **Normal**     | `<leader>/`          | Grep                                 |
|     **Normal**     | `<leader>:`          | Command History                      |
|     **Normal**     | `<leader>fb`         | Buffers                              |
|     **Normal**     | `<leader>fc`         | Find Config File                     |
|     **Normal**     | `<leader>ff`         | Find Files                           |
|     **Normal**     | `<leader>fg`         | Find Git Files                       |
|     **Normal**     | `<leader>fp`         | Projects                             |
|     **Normal**     | `<leader>fr`         | Recent                               |
|     **Normal**     | `<leader>o`          | Convert Markdown to PDF              |
|     **Normal**     | `<leader>oq`         | Toggle KNAP auto-preview             |
|     **Normal**     | `<C-n>`              | New file                             |
|     **Normal**     | `<C-.>`              | Show Config                          |
|     **Normal**     | `<C-p>`              | Find files (including hidden)        |
|     **Normal**     | `<C-f>`              | Find Text                            |


### 💾 File Actions (Save, Quit, Undo, Redo)
|        Mode        |         Key          |             Description              |
|--------------------|----------------------|--------------------------------------|
|     **Normal**     | `<C-s>`              | Save file                            |
|     **Normal**     | `<leader>q`          | Quit Neovim                          |
|  `n`, `v`, `i`, `c`| `<C-q>`              | Quit from any mode                   |
|      `n`, `i`      | `<C-z>`              | Undo                                 |
|      `n`, `i`      | `<C-y>`              | Redo                                 |


### 📋Clipboard & Text
|        Mode        |         Key          |             Description              |
|--------------------|----------------------|--------------------------------------|
|     **Normal**     | `<C-a>`              | Select all text                      |
|  `n`, `v`, `i`, `c`| `<C-c>`              | Copy to clipboard                    |
|  `n`, `v`, `i`, `c`| `<C-v>`              | Paste from clipboard                 |
|  `n`, `v`, `i`, `c`| `<C-x>`              | Cut to clipboard                     |
|    `n`, `i`, `v`   | `<C-/>`              | Toggle comment                       |
|     **Normal**     | `<C-h>`              | Replace text (global)                |
|     **Normal**     | `<C-d>`              | Select next occurrence               |


### ✏️ Text Editing & Selection
|        Mode        |         Key          |             Description              |
|--------------------|----------------------|--------------------------------------|
|    `n`, `i`, `v`   | `<C-S-Up>`           | Duplicate line up                    |
|    `n`, `i`, `v`   | `<C-S-Down>`         | Duplicate line down                  |
|     **Normal**     | `<A-j>`              | Move line down                       |
|     **Normal**     | `<A-k>`              | Move line up                         |
|     **Visual**     | `<A-j>`              | Move selected block down             |
|     **Visual**     | `<A-k>`              | Move selected block up               |
|     **Visual**     | `<Tab>`              | Indent right                         |
|     **Visual**     | `<S-Tab>`            | Indent left                          |
|     **Insert**     | `<S-Left>`           | Select text left                     |
|     **Insert**     | `<S-Right>`          | Select text right                    |
|     **Insert**     | `<S-Up>`             | Select text up                       |
|     **Insert**     | `<S-Down>`           | Select text down                     |
|     **Insert**     | `<S-Home>`           | Select to line start                 |
|     **Insert**     | `<S-End>`            | Select to line end                   |
|     **Insert**     | `<S-PageUp>`         | Select one page up                   |
|     **Insert**     | `<S-PageDown>`       | Select one page down                 |


### 🪟 Window & Buffer Management
|        Mode        |         Key          |             Description              |
|--------------------|----------------------|--------------------------------------|
|     **Normal**     | `<leader>sv`         | Split vertically                     |
|     **Normal**     | `<leader>sh`         | Split horizontally                   |
|     **Normal**     | `<leader>se`         | Equalize split sizes                 |
|     **Normal**     | `<leader>sx`         | Close split                          |
|     **Normal**     | `te`                 | Edit in new tab                      |
|     **Normal**     | `<C-Tab>`            | Next tab                             |
|     **Normal**     | `<C-S-Tab>`          | Previous tab                         |
|     **Normal**     | `<C-n>`              | New tab                              |
|     **Normal**     | `<C-w>`              | Close tab                            |
|     **Normal**     | `<Tab>`              | Next buffer                          |
|     **Normal**     | `<S-Tab>`            | Previous buffer                      |
|     **Normal**     | `<leader>x`          | Close buffer                         |
|     **Normal**     | `<A-p>`              | Pin buffer                           |


### 🧩 Git Integration & LSP
|        Mode        |         Key          |             Description              |
|--------------------|----------------------|--------------------------------------|
|     **Normal**     | `<leader>gb`         | Git Branches                         |
|     **Normal**     | `<leader>gl`         | Git Log                              |
|     **Normal**     | `<leader>gL`         | Git Log Line                         |
|     **Normal**     | `<leader>gs`         | Git Status                           |
|     **Normal**     | `<leader>gS`         | Git Stash                            |
|     **Normal**     | `<leader>gd`         | Git Diff (Hunks)                     |
|     **Normal**     | `gd`                 | Goto Definition                      |
|     **Normal**     | `gD`                 | Goto Declaration                     |
|     **Normal**     | `gr`                 | References                           |
|     **Normal**     | `gI`                 | Goto Implementation                  |
|     **Normal**     | `gy`                 | Goto Type Definition                 |
|     **Normal**     | `<leader>ss`         | LSP Symbols                          |
|     **Normal**     | `<leader>sS`         | LSP Workspace Symbols                |


### 🖱️ Miscellaneous
|        Mode        |         Key          |             Description              |
|--------------------|----------------------|--------------------------------------|
|      `n`, `v`      | `<RightMouse>`       | Open right-click menu                |
|     **Normal**     | `<leader>td`          | To-do (Top Right)                   |

## Thanks To

- folke (plugin)
- gh0stzk (based)

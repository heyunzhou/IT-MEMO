## vscode

### settings.json

```json
{
    "tabnine.experimentalAutoImports": true,
    "editor.suggestSelection": "first",
    "vsintellicode.modify.editor.suggestSelection": "automaticallyOverrodeDefaultValue",
    "editor.fontSize": 16,
    "vim.handleKeys": {
        "<C-d>": true,
        "<C-a>": false,
        "<C-c>": false,
        "<C-x>": false,
        "<C-f>": false,
        "<C-h>": false,
        "<C-s>": false,
        "<C-z>": false,
        "<C-v>": false,
        "<C-.>": false,
        "<C-y>": false
    },
    "editor.lineNumbers": "on",
    "liveServer.settings.donotShowInfoMsg": true,
    "workbench.colorTheme": "Visual Studio Dark",
    "vim.leader": "<space>",
    "vim.commandLineModeKeyBindings": [],
    "vim.normalModeKeyBindings": [
        {
            "before": ["v","w"],
            "after":  ["v","i","w"]
        },
        {
            "before": ["c","w"],
            "after":  ["c","i","w"]
        },
        {
            "before": ["d","w"],
            "after":  ["d","i","w"]
        },
        {
            "before": ["y","w"],
            "after":  ["y","i","w"]
        },
        {
            "before": ["v","b"],
            "after":  ["v","i","b"]
        },
        {
            "before": ["c","b"],
            "after":  ["c","i","b"]
        },
        {
            "before": ["d","b"],
            "after":  ["d","i","b"]
        },
        {
            "before": ["y","b"],
            "after":  ["y","i","b"]
        },
        {
            "before": ["v","B"],
            "after":  ["v","i","B"]
        },
        {
            "before": ["c","B"],
            "after":  ["c","i","B"]
        },
        {
            "before": ["d","B"],
            "after":  ["d","i","B"]
        },
        {
            "before": ["y","B"],
            "after":  ["y","i","B"]
        },
        {
            "before": ["v","\""],
            "after":  ["v","i","\""]
        },
        {
            "before": ["c","\""],
            "after":  ["c","i","\""]
        },
        {
            "before": ["d","\""],
            "after":  ["d","i","\""]
        },
        {
            "before": ["y","\""],
            "after":  ["y","i","\""]
        },
        {
            "before": ["H"],
            "after":  ["^"]
        },
        {
            "before": ["L"],
            "after":  ["$"]
        },
        {
            "before": ["n"],
            "after":  ["n","z","z"]
        },
        {
            "before": ["N"],
            "after":  ["N","z","z"]
        },
        {
            "before": [">"],
            "after":  [">",">"]
        },
        {
            "before": ["<"],
            "after":  ["<","<"]
        }
    ],
    "vim.visualModeKeyBindingsNonRecursive": [
        {
            "before": ["H"],
            "after":  ["^"]
        },
        {
            "before": ["L"],
            "after":  ["$"]
        },
        {
            "before": [">"],
            "after":  [">","g","v"]
        },
        {
            "before": ["<"],
            "after":  ["<","g","v"]
        }
    ],
    "vim.insertModeKeyBindings": [
        {
            "before": ["j","j"],
            "after":  ["<Esc>"]
        }
    ]
}
```



### 日本語設定

https://github.com/iuchim/zenhan

```
"vim.autoSwitchInputMethod.enable": true,
"vim.autoSwitchInputMethod.defaultIM": "0",
"vim.autoSwitchInputMethod.obtainIMCmd": "D:\\bin\\zenhan.exe",
"vim.autoSwitchInputMethod.switchIMCmd": "D:\\bin\\zenhan.exe {im}"
```

`build.sh`をビルドする前に、下記をインストール

```
sudo apt-get update
sudo apt-get install g++-mingw-w64-x86-64
```

## idea

### プラグイン

```java
" https://github.com/JetBrains/ideavim
let mapleader=" "
"" -- Suggested options --
" Show a few lines of context around the cursor. Note that this makes the
" text scroll if you mouse-click near the start or end of the window.
set scrolloff=5
map <leader>9 <Action>(IdeaVim.ReloadVimRc.reload)

"" -- SEARCHING --
set incsearch
set hlsearch
nmap <Esc><Esc> :nohl<CR>
set ignorecase
set smartcase


" Don't use Ex mode, use Q for formatting.
map Q gq

"" -- VIM PLUGINS --
set surround
set ideajoin
set highlightedyank
set multiple-cursors
set ReplaceWithRegister
set exchange
set easymotion
nmap f <Plug>(easymotion-s2)

"" -- NORMAL MODE --
nnoremap J 5j
nnoremap K 5k
nnoremap gj J

" motion full method
nnoremap vm vaBV
nnoremap dm vaBVd
nnoremap cm vaBVc
nnoremap ym vaBVy

nnoremap <leader>; "0p
nnoremap vv <C-v>

nnoremap vw viw
nnoremap yw yiw
nnoremap cw ciw
nnoremap dw diw

nnoremap vb vib
nnoremap yb yib
nnoremap cb cib
nnoremap db dib

nnoremap vB viB
nnoremap yB yiB
nnoremap cB ciB
nnoremap dB diB

nnoremap v" vi"
nnoremap y" yi"
nnoremap c" ci"
nnoremap d" di"

nnoremap v' vi'
nnoremap y' yi'
nnoremap c' ci'
nnoremap d' di'

nnoremap n nzz
nnoremap N Nzz

nnoremap > >>
nnoremap < <<

nnoremap Y y$

"" -- VISUAL MODE --
vnoremap > >gv
vnoremap < <gv

"" -- VISUAL MODE + NORMAL MODE --
noremap H ^
noremap L $

noremap + <C-a>
noremap <leader>+ g<C-a>
noremap - <C-x>
"" -- INSERT MODE --
inoremap <C-k> <C-o>D<Right>
inoremap jj <ESC>

"" -- IDEA ACTION --
" Debug
map <leader>d <Action>(Debug)
map <leader>w <Action>(Debugger.AddToWatch)
map <leader>c <Action>(Stop)
map <leader>b <Action>(ToggleLineBreakpoint)

" Window
map <leader><Right> <Action>(MoveTabRight)
map <leader><Left> <Action>(MoveEditorToOppositeTabGroup)
map <leader><Down> <Action>(SplitHorizontally)
map <leader>x <Action>(CloseContent)
map <leader>X <Action>(ReopenClosedTab)

" FORMAT
map <leader>r <Action>(ReformatCode)

" FIND ERROR
map <leader>j <Action>(GotoNextError)
map <leader>k <Action>(GotoPreviousError)

" FIND FILE & ACTION
map <leader>f <Action>(FindInPath)
map <leader>a <Action>(GotoAction)
map <leader>n <Action>(GotoFile)
```


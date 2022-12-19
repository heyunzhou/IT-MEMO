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
AceJump
IdeaVim
IdeaVim-EasyMotion
IdeaVimExtension
```

### .ideavimrc

```java
"" Source your .vimrc
"source ~/.vimrc

"" -- Suggested options --
" Show a few lines of context around the cursor. Note that this makes the
" text scroll if you mouse-click near the start or end of the window.
set scrolloff=5

" Do incremental searching.
set incsearch

" Don't use Ex mode, use Q for formatting.
map Q gq


" Find more examples here: https://jb.gg/share-ideavimrc
set easymotion
" sで開始
nmap s <Plug>(easymotion-s2)

" 日本語入力設定
set keep-english-in-normal
```


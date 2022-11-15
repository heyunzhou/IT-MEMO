## vscode

### settings.json

```json
{
    "workbench.colorTheme": "Default Dark+",
    "vim.commandLineModeKeyBindingsNonRecursive": [

    
    ],
    "vim.handleKeys": {
        "<C-d>": true,
        "<C-s>": false,
        "<C-x>": false,
        "<C-c>": false,
        "<C-v>": false,
        "<C-z>": false,
        "<C-f>": false
    },
    "editor.codeActionsOnSave": {
    
    },
    "editor.semanticTokenColorCustomizations": {
    
    },
    "vim.autoSwitchInputMethod.enable": true,
    "vim.autoSwitchInputMethod.defaultIM": "0",
    "vim.autoSwitchInputMethod.obtainIMCmd": "C:\\LocalWork\\07.vscode\\zenhan-master\\zenhan\\bin64\\zenhan.exe",
    "vim.autoSwitchInputMethod.switchIMCmd": "C:\\LocalWork\\07.vscode\\zenhan-master\\zenhan\\bin64\\zenhan.exe {im}",
    "vim.commandLineModeKeyBindings": [
    
    ]
}
```



### 日本語設定

https://github.com/iuchim/zenhan

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


## オプション

| option | 意味                         |
| ------ | -------------------------- |
| -i     | 大文字と小文字を区別せず検索する           |
| -E     | 拡張正規表現で検索を行う               |
| -e     | 一致処理に指定した正規表現を使う           |
| -v     | 一致しないものを検索する               |
| -n     | 検索結果に行番号を表示する              |
| -l     | 検索結果にファイル名のみ表示する           |
| -h     | 検索結果にファイル名を表示しない           |
| -o     | 検索結果に一致した文字を表示する           |
| -C     | 検索結果に一致した箇所から前後に指定した行数表示する |
| -r     | ディレクトリ内も検索対象とする            |
| -L     | 検索した結果、該当しなったファイルを表示する     |

[grepコマンドの詳細まとめました【Linuxコマンド集】](https://eng-entrance.com/linux-command-grep#-E)

```textile
Pattern selection and interpretation:
  -E, --extended-regexp     PATTERNS are extended regular expressions
  -F, --fixed-strings       PATTERNS are strings
  -G, --basic-regexp        PATTERNS are basic regular expressions
  -P, --perl-regexp         PATTERNS are Perl regular expressions
  -e, --regexp=PATTERNS     use PATTERNS for matching
  -f, --file=FILE           take PATTERNS from FILE
  -i, --ignore-case         ignore case distinctions in patterns and data
      --no-ignore-case      do not ignore case distinctions (default)
  -w, --word-regexp         match only whole words
  -x, --line-regexp         match only whole lines
  -z, --null-data           a data line ends in 0 byte, not newline

Miscellaneous:
  -s, --no-messages         suppress error messages
  -v, --invert-match        select non-matching lines
  -V, --version             display version information and exit
      --help                display this help text and exit

Output control:
  -m, --max-count=NUM       stop after NUM selected lines
  -b, --byte-offset         print the byte offset with output lines
  -n, --line-number         print line number with output lines
      --line-buffered       flush output on every line
  -H, --with-filename       print file name with output lines
  -h, --no-filename         suppress the file name prefix on output
      --label=LABEL         use LABEL as the standard input file name prefix
  -o, --only-matching       show only nonempty parts of lines that match
  -q, --quiet, --silent     suppress all normal output
      --binary-files=TYPE   assume that binary files are TYPE;
                            TYPE is 'binary', 'text', or 'without-match'
  -a, --text                equivalent to --binary-files=text
  -I                        equivalent to --binary-files=without-match
  -d, --directories=ACTION  how to handle directories;
                            ACTION is 'read', 'recurse', or 'skip'
  -D, --devices=ACTION      how to handle devices, FIFOs and sockets;
                            ACTION is 'read' or 'skip'
  -r, --recursive           like --directories=recurse
  -R, --dereference-recursive  likewise, but follow all symlinks
      --include=GLOB        search only files that match GLOB (a file pattern)
      --exclude=GLOB        skip files that match GLOB
      --exclude-from=FILE   skip files that match any file pattern from FILE
      --exclude-dir=GLOB    skip directories that match GLOB
  -L, --files-without-match  print only names of FILEs with no selected lines
  -l, --files-with-matches  print only names of FILEs with selected lines
  -c, --count               print only a count of selected lines per FILE
  -T, --initial-tab         make tabs line up (if needed)
  -Z, --null                print 0 byte after FILE name
```

## 使い方

### 文法

```shell
grep [options] search_string path/to/file
```

### 行検索（複数キーOR）

```shell
grep –E 'key1|key2' file
```

### 行検索（複数キーAND）

```shell
grep key1 file | grep key2
```

### ファイル検索（複数キーAND）

```shell
# 拡張子指定
grep --include=\*.sql -rlE key1 Folder | xargs grep -l key2
# フォルダを除外
grep --exclude-dir={folder1,folder2} -rlE key1 Folder | xargs grep -l key2
```

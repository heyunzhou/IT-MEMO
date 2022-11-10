# 基本操作

## 01.符号変換

| Title        | Escape Character  |
| ------------ | ----------------- |
| single quote | chr(39)           |
| double quote | chr(34)           |
| 改行         | vbCrLf｜vbnewline |

## 02.オブジェクト選択

| Title                                            | 意味                     |
| ------------------------------------------------ | ------------------------ |
| Range(Selection, Selection.End(xlDown))          | 上から下までの範囲を選定 |
| Range(Selection, Selection.End(xlToRight))       | 左から右までの範囲を選定 |
| Range("A1")                                      | セルA１                  |
| Cells（1,1）                                     | セルA１                  |
| Columns("B:B")                                   | B列を選ぶ                |
| Rows("1:1")                                      | 第一行目を選ぶ           |
| ActiveCell.Offset(rowOffset:=2, columnOffset:=3) | セルの下２行目、右第３列 |

## 03.文字列操作

| Function                          | 意味                                     |
| --------------------------------- | ---------------------------------------- |
| Len(string)                       | 長さ                                     |
| Trim(string)                      | 空白削除                                 |
| Mid(string,startIndex,length)     | サブ文字列                               |
| Split(string, Delimiter)          | 文字列を分割して配列を返す               |
| replace(string,find,replacement)  | 部分文字を置換する                       |
| InStr(string,find)                | sub文字のIndexを返す。無い場合、０を返す |
| StrConv(string, vbWide｜vbNarrow) | 文字列を【全角｜半角】に転換             |

# Snippets

## 01.テキストに出力

### デフォルト

```vb
Open "filePath" For Output As #1
Print #1, "content"	
Close #1
```

### FileSystemObject

```vb
Set fs = CreateObject("Scripting.FileSystemObject")
Set a = fs.CreateTextFile("c:\testfile.txt", True)
a.WriteLine("This is a test.")
a.Close
```

### ADODB

```vb
Debug.Print ("start")
Dim csvFile As String
csvFile = ActiveWorkbook.path & "\data.txt"

'ADODB.Stream生成
Dim adoSt As Object
Set adoSt = CreateObject("ADODB.Stream")
    With adoSt
    .Charset = "UTF-8"
    .LineSeparator = 10 'adLF
    .Open
    .WriteText "hello", 1 'adWriteLine
    .SaveToFile csvFile, 2 'adSaveCreateOverWrite
    .Close
End With
Debug.Print ("end")
```

## 02.フォルダを作成

```vb
MkDir "MYDIR" ' Make new directory or folder. 
```

## 03.ファイルコピー

```vb
Dim SourceFile, DestinationFile 
SourceFile = "SRCFILE" ' Define source file name. 
DestinationFile = "DESTFILE" ' Define target file name. 
FileCopy SourceFile, DestinationFile ' Copy source to target.
```

## 04.ダイアログ

```vb
Dim fd As FileDialog 
'msoFileDialogFilePicker
'msoFileDialogFolderPicker
Set fd = Application.FileDialog(msoFileDialogFilePicker) 
Dim vrtSelectedItem As Variant 
With fd 
    If .Show = -1 Then
        For Each vrtSelectedItem In .SelectedItems 
        MsgBox "The path is: " & vrtSelectedItem 
        Next vrtSelectedItem 
    Else 
    End If 
 End With 
Set fd = Nothing
```

## 07.ファイル検索

```vb
'folder内のパータンと一致するファイルを探す
Dim buf As String, msg As String
buf = Dir("\folder\tanaka*.txt")
Do While buf <> ""
    debug.print buf
buf = Dir()
Loop
MsgBox msg
```

# Excel関数

## 01.SQLデータ結合用

`=CLEAN(CONCAT("""", TEXTJOIN(""",""", FALSE, B13:N13), """"))`

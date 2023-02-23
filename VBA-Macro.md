### 01.ファイル検索

```vb
Sub SearchFile()
    '結果をクリア
    Range(Rows("6:6"), ActiveCell.SpecialCells(xlLastCell)).ClearContents
    
    c = Timer
    LoopFile (Range("b3").Value)
    LoopFolder (Range("b3").Value)
    costTime = Timer - c
    Debug.Print (costTime * 1000) & " ms"
End Sub
'フォルダ(サブフォルダ含む)内ファイルを繰り返す
Function LoopFolder(path As String)
    Set fs = CreateObject("Scripting.FileSystemObject")
    Set filePool = fs.getfolder(path)
    For Each ifolder In filePool.subfolders
        LoopFile (ifolder)
        LoopFolder (ifolder)
    Next
End Function
'指定フォルダ内のファイルを繰り返す
Function LoopFile(path As String)
    Dim buf As String
    Dim mPattern As String
    mPattern = "\*" & Range("b1").Value & "*." & Range("b2").Value
'指定パータンに当てはまるファイルを出力
    buf = Dir(path & mPattern)
    Do While buf <> ""
        Call OutPut(buf, path)
        buf = Dir()
    Loop
End Function

Function OutPut(name As String, path As String)
    If Range("b6").Value = "" Then
        row = 6
    Else
        num = Range(Range("b5"), Range("b5").End(xlDown)).Count
        row = 5 + num
    End If

    Range("b" & row).Value = name

    With ActiveSheet
        .Hyperlinks.Add Anchor:=.Range("c" & row), _
        Address:=path & "\" & name, _
        TextToDisplay:="open"
    End With

    With ActiveSheet
        .Hyperlinks.Add Anchor:=.Range("d" & row), _
        Address:=path, _
        TextToDisplay:=path
    End With
End Function

```
### 02.指定ファイルを開く

```vb
Sub OpenFile()
    Dim path As String
    path = "検索場所を指定"
    LoopFolder (path)
End Sub

'フォルダ(サブフォルダ含む)内ファイルを繰り返す
Function LoopFolder(path As String)
    Set fs = CreateObject("Scripting.FileSystemObject")
    Set filePool = fs.getfolder(path)
    For Each ifolder In filePool.subfolders
        LoopFile (ifolder)
        LoopFolder (ifolder)
    Next
End Function
'指定フォルダ内のファイルを繰り返す
Function LoopFile(path As String)
    Dim buf As String
    Dim mPattern As String
    
    'InStr(string,find)
    'Mid(string,startIndex,length)
    mPattern = "\検索ファイル名を指定"

    buf = Dir(path & mPattern)
    Do While buf <> ""
        Call OutPut(buf, path)
        buf = Dir()
    Loop
End Function
Function OutPut(name As String, path As String)
    Workbooks.Open path & "\" & name
End Function
```

### 03.MergeExcel

```vb
Sub mergeExcel()
'ダイアログを開く
Set fd = Application.FileDialog(msoFileDialogFolderPicker)

'フォルダを選択した場合、フォルダ内のEXCELをマージする
If fd.Show = -1 Then
    Path = fd.SelectedItems(1) & "\"
    Filename = Dir(Path & "*.xlsx")
    Do While Filename <> ""
        Workbooks.Open Filename:=Path & Filename, ReadOnly:=True
        For Each Sheet In ActiveWorkbook.Sheets
            Sheet.Copy After:=ThisWorkbook.Sheets(1)
        Next Sheet
        Workbooks(Filename).Close
        Filename = Dir()
    Loop
End If
End Sub

```
### 04.SplitExcel

```vb
Sub SplitExcel()
Dim xPath As String
xPath = Application.ActiveWorkbook.Path
Application.ScreenUpdating = False
Application.DisplayAlerts = False
For Each xWs In ThisWorkbook.Sheets
    xWs.Copy
    Application.ActiveWorkbook.SaveAs Filename:=xPath & "\" & xWs.Name & ".xlsx"
    Application.ActiveWorkbook.Close False
Next
Application.DisplayAlerts = True
Application.ScreenUpdating = True
End Sub
```
### 05.検索文字を色付

```vb
Sub ChgTxtColor()
    Set myRange = ActiveSheet.UsedRange 'The Range that contains the substring you want to change color

    substr = InputBox("input text plz")  'The text you want to change color
    If substr = "" Then Exit Sub

    txtColor = InputBox("1 is red " & Chr(10) & "2 is green " & Chr(10) & "3 is blue " & Chr(10) & "4 is pink " & Chr(10) & "5 is purple ")    'The ColorIndex which repsents the color you want to change
    If txtColor = "" Then Exit Sub
    
    Select Case txtColor
       Case 1
          txtColor = 3 'red
       Case 2
          txtColor = 4 'green
       Case 3
          txtColor = 33 'blue
       Case 4
          txtColor = 22 'pink
       Case 5
          txtColor = 39 'purple
       Case Else
          MsgBox "Unknown Number"
    End Select

    For Each myString In myRange
        lenstr = Len(myString)
        lensubstr = Len(substr)
        For i = 1 To lenstr
            tempString = Mid(myString, i, lensubstr)
            If tempString = substr Then
                myString.Characters(Start:=i, Length:=lensubstr).Font.ColorIndex = txtColor
            End If
        Next i
    Next myString
End Sub

```
### 06.画像のインポート

```vb
Sub importPic()
    Dim sFolder As String
    ' Open the select folder prompt
    With Application.FileDialog(msoFileDialogFolderPicker)
        If .Show = -1 Then ' if OK is pressed
            sFolder = .SelectedItems(1)
        End If
    End With
    
    If sFolder <> "" Then ' if a file was chosen
        Set fs = CreateObject("Scripting.FileSystemObject")
        Set fder = fs.GetFolder(sFolder)
        
        xy = "A1"
        For Each ifile In fder.Files
            Range(xy).Select
            ActiveSheet.Pictures.Insert( _
            ifile.Path).Select
            Set c = Selection.BottomRightCell
            xy = "A" & (2 + c.Row)
        Next
    End If
End Sub

```
### 07.テンプレートデータ

```vb
Sub createDataFromTemplate()
    Dim fromPath As String
    Dim toPath As String
    Dim fileName As String
    fileName = ActiveSheet.name
    fromPath = ActiveWorkbook.path & "\template\" & fileName & ".json"
    toPath = ActiveWorkbook.path & "\datas\" & fileName & ".json"

    'テンプレートの読み込み
    Dim buf As String
    buf = readFile(fromPath)
    'データ生成
    Dim output As String
    output = ""
    Dim myCell As String
    myCell = "b2"
    
    Dim replacement As String
    Dim str As String
    For i = Range(myCell).row To Range(myCell).row + Range(Range(myCell), Range(myCell).End(xlDown)).Count - 2
        str = buf
        For Each j In Range(Range(myCell), Range(myCell).End(xlToRight))
            replacement = "【" & Cells(Range(myCell).row, j.Column).Value & "】"
            str = Replace(str, replacement, Cells(i + 1, j.Column).Value)
        Next
        output = output & str
    Next
    'データの書き出し
    Call writeFile(output, toPath)
    MsgBox "実行完了"
End Sub

'ファイルに書き込み
Function writeFile(output As String, toPath As String)
    Dim adoSt As Object
    Set adoSt = CreateObject("ADODB.Stream")
    With adoSt
        .Charset = "UTF-8"
        .LineSeparator = 10 'adLF
        .Open
        .WriteText output, 0 'adWriteLine
        .SaveToFile toPath, 2
        .Close
    End With
End Function

'ファイルの読み込み
Function readFile(fromPath As String) As String
    Dim adoSt As Object
    Set adoSt = CreateObject("ADODB.Stream")
    With adoSt
        .Charset = "UTF-8"
        .LineSeparator = 10 'adLF
        .Open
        .LoadFromFile fromPath
        readFile = .ReadText
        .Close
    End With
End Function
```

### 08.赤枠

```vb
Sub redFrame()
    Selection.ShapeRange.Fill.Visible = msoFalse
    With Selection.ShapeRange.Line
        .Visible = msoTrue
        .ForeColor.RGB = RGB(255, 0, 0)
        .Transparency = 0
        .Weight = 3
    End With
End Sub
```

### 09.シート作成

```vb
Sub createSheetsByList()
    Range("a1").Select
    For Each mc In Range(Selection, Selection.End(xlDown))
        If Sheet_Exists(mc.Value) = False Then
            Sheets.Add After:=Sheets(Sheets.Count)
            ActiveSheet.Name = mc.Value
        End If
    Next
    Sheets("Sheet1").Select
End Sub
'シート存在かを判定
Function Sheet_Exists(WorkSheet_Name As String) As Boolean
    Dim Work_sheet As Worksheet
    Sheet_Exists = False
    For Each Work_sheet In ThisWorkbook.Worksheets
        If Work_sheet.Name = WorkSheet_Name Then
            Sheet_Exists = True
        End If
    Next
End Function
```


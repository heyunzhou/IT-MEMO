## Shell

### if文

```shell
#!/bin/bash
if [ $1 -eq 0 ]
then
	echo yes
else
	echo no
fi
```

### for文

```shell
#FOREACH
for i in $@
do
	echo $i
done

#FOR
for((i =0; i <10; i++))
do
	echo $i
done
```

### while文

```shell
while [ "$ans" != "yes" ]
do
read -p "please input yes to exit loop:" ans
done
```

### Array配列

```shell
# 初期化
arr=(1 2 3 4 5)
# 出力の結果を配列に格納
arr=(`find . -name fName`) 
# 要素の値を確認
 echo ${arr[2]}
# 要素の値をクリア
 unset arr[1]
# 配列の末尾に要素を追加
 arr[${#arr[@]}]=6
# length
 echo ${#arr[@]}
# 全配列を見る
 echo ${arr[*]}
# sub配列
 echo ${arr[@]:0:3}
```

### head | tail

```shell
#上からN行目以前の内容を取得
head +20 notes.log
#下からN行目以前の内容を取得
head -20 notes.log

#監視
tail -f notes.log
#上からN行目以後の内容を取得
tail +20 notes.log
#下からN行目以後の内容を取得
tail -20 notes.log
```

### grep

```shell
#検索したい文字を含む行を取得
grep "string" *.txt
#検索したい文字を含まない行を取得
grep -V "string" *.txt
#正規表現を使用
grep -E "string[0-9]" *.txt
#他の使用例
cat file | grep "string"
```

### find

```shell
#ファイルやフォルダを検索コマンド
#名前指定でファイルやフォルダ検索
find path -name "*.txt"
find path -name "*.txt" -type f #ファイルのみ検索
find path -name "*.txt" -type d #フォルダのみ検索
#権限指定で検索
find path -perm 777
#ユーザーで検索
find path -user root
#変更時間で検索
find path -mtime -5 #5日以内のもの
find path -mtime +3 #3日以前のもの
#サイズで検索
find path -size +1024ｋ #1M以上のもの
find path -size -1024ｋ #1M以下のもの
#検索したものに他の処理を追加
find path -name "*.txt"|xargs rm -rf #削除
find path -name "*.txt"|xargs ls -l #権限を見る
```

### sed

```shell
#２行目を表示（$は最後行）
sed -n '2'p file
#１行目～４行目を表示
sed -n '1,4'p file
#正規表現使用、losを含む行をを表示
sed -n '/los/'p file
#正規表現使用、４行目からlosを含む行までの内容をを表示
sed -n '4,/los/'p file
#１行２行目を表示しない
sed -n '1,2'd file
```

### awk

```shell
#ファイル内の全部列を表示
awk '{print $0}' file.txt
#ファイル内の第１列と第７列を表示
awk '{print $１,$7}' file.txt
#ファイル内の第１列と第７列を表示(「：」で分割した列)
awk -F: '{print $１”\t”$7}' file.txt
#ファイル内の第３行目の第１列を整数に変換して表示(NRは行の意味、NFは列の意味)
awk '{if(NR==3){print int($１)}}' file.txt
#ファイル内の[192.168.100.1]を含む全部列を表示(「!~」は含まない)
cat file | awk '{print $１~/192.168.100.1/{print $0}}' 
```

### rsync

```shell
#ローカル
rsync -av コピー元パス コピー先パス
#転送後に転送元のファイルを削除
rsync --remove-source-files -av コピー元パス コピー先パス
#リモート先
rsync -av -e ssh コピーパス ユーザー@ホスト名:コピー先パス

#パスワードなしのrsync使用方法（リモート）
#1 鍵生成
ssh-keygen
#2 公開鍵をリモートに転送
ssh-copy-id -i ~/.ssh/id_rsa.pub ユーザー@ホスト名
```

参照：https://www.linuxprobe.com/rsync-password-less-through-ssh.html

### uniq

```shell
#重複内容を排除して表示
uniq file
#重複回数を表示
uniq -c file
#重複行のみ表示
uniq -d file
```

### sort

```shell
#昇順
sort file 
#降順
sort -r file 
#「:」で分割、一列目の降順
cat file | sort -t: -k1 -r
```

### less

|        | コマンド         | 動作内容                                                     |
| :----- | :--------------- | :----------------------------------------------------------- |
| 読込   | r                | 画面を再描画します。                                         |
| 読込   | R                | 画面を再描画します。(閲覧中に変更があった場合にその内容が反映されます。) |
| 読込   | F                | ファイルの最終行を読み続けます。(「tail -f」コマンドと同様)  |
| 移動   | SPACE            | 1画面進めます。                                              |
| 移動   | d                | 半画面進めます。                                             |
| 移動   | RETURN           | 1行進めます。                                                |
| 移動   | b                | 1画面戻ります。                                              |
| 移動   | u                | 半画面戻ります。                                             |
| 移動   | y                | 1行戻ります。                                                |
| 移動   | g, <             | ファイルの先頭に移動します。                                 |
| 移動   | G, >             | ファイルの終端に移動します。                                 |
| 検索   | /パターン        | 「パターン」マッチする前方検索を行います。                   |
| 検索   | ?パターン        | 「パターン」マッチする後方検索を行います。                   |
| 検索   | n                | 前回の検索を繰り返します。                                   |
| 検索   | N                | 前回の検索を逆方向へ繰り返します。                           |
| ヘルプ | h, H             | ヘルプを表示します。                                         |
| 終了   | q, Q, :q, :Q, ZZ | 終了します。                                                 |

### 権限

```shell
#権限を変更
chmod 777 file
#よく使う権限
-rw------- (600)    只有拥有者有读写权限。
-rw-r--r-- (644)    只有拥有者有读写权限；而属组用户和其他用户只有读权限。
-rwx------ (700)    只有拥有者有读、写、执行权限。
-rwxr-xr-x (755)    拥有者有读、写、执行权限；而属组用户和其他用户只有读、执行权限。
-rwx--x--x (711)    拥有者有读、写、执行权限；而属组用户和其他用户只有执行权限。
-rw-rw-rw- (666)    所有用户都有文件读、写权限。
-rwxrwxrwx (777)    所有用户都有读、写、执行权限。
```

※参照：https://blog.csdn.net/u013197629/article/details/73608613

### その他

```shell
#プロセスを調べる
ps -ef | grep ssh
#行数を統計する
xxxx | wc -l
#フォルダコピー（dir2存在しない場合）
cp -r dir1 dir2
#ファイルを５行ごとに分割
split -5 file newfile
#bash内スレッドのPID
echo $BASHPID

#diskの確認
df -h
#メモリの確認
free
```

### 並行処理

```shell
#!/bin/bash
# bam to bed

start_time=`date +%s`

# 新建一个FIFO类型的文件,将FD6指向FIFO类型
tmp_fifofile="/tmp/$$.fifo"
mkfifo $tmp_fifofile
exec 6<>$tmp_fifofile
rm $tmp_fifofile
# 定义最大线程数
thread_num=5

#根据线程总数量设置令牌个数
#事实上就是在fd6中放置了$thread_num个回车符
for ((i=0;i<${thread_num};i++));do
    echo
done >&6

for i in data/*.bam
do
    # 一个read -u6命令执行一次，就从FD6中减去一个回车符，然后向下执行
    # 当FD6中没有回车符时，就停止，从而实现线程数量控制
    read -u6
    {
        echo "great"
        echo >&6
    } &
done
# 要有wait，等待所有线程结束
wait

stop_time=`date +%s
echo "TIME:`expr $stop_time - $start_time`"
# 关闭FD6
exec 6>&-
echo "over"
```

参照：https://zhuanlan.zhihu.com/p/68574239

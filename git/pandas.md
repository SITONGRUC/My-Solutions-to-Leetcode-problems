1. pwd: 

print working directory

2. ls: 

list all files 

3. cd: 

cd /Users/riomoukiri/Documents 

or 

cd "./my" 

cd .. (go back to last path)

4.  echo example

 echo "import pandas as pd" > start.py (create a new txt doc)

echo  "import numpy as pd" >> start.py (add a new line to this file )

5. date : show what today's date is 

6. mv (move, could rename the files as well)

mv "start.py" "./data/st.py"

7. CP （copy . could renmae the files as well ）

8. rm no recurssion 

rmdir (removeable only if the dir it's empgty)

9. mkdir / rmdir 

10. cat : print 

foo=bar

echo "hello"

foo=$(pwd)

echo $foo

echo "we are in $(pwd)"

ls *.sh

ls *.pdf


convert image.png image.jpg

:w (save)
"q

## Inserting text

From Normal mode, press i to enter Insert mode. Now, Vim behaves like any other text editor, until you press <ESC> to return to Normal mode. This, along with the basics explained above, are all you need to start editing files using Vim (though not particularly efficiently, if you’re spending all your time editing from Insert mode).

一、vim还没有启动的时候：
1.在终端里输入 
vim file1 file2 ... filen便可以打开所有想要打开的文件
2.vim已经启动
输入
:e file
可以再打开一个文件，并且此时vim里会显示出file文件的内容。
3.同时显示多个文件：
:sp         //水平切分窗口
:vsplit     //垂直切分窗口
二、在文件之间切换：
1.文件间切换
Ctrl+6  //两文件间的切换
:bn      //下一个文件
:bp      //上一个文件
:ls       //列出打开的文件，带编号
:b1~n  //切换至第n个文件
对于用(v)split在多个窗格中打开的文件，这种方法只会在当前窗格中切换不同的文件。
2.在窗格间切换的方法
Ctrl+w+方向键——切换到前／下／上／后一个窗格
Ctrl+w+h/j/k/l ——同上
Ctrl+ww——依次向后切换到下一个窗格中



Basic movement: hjkl (left, down, up, right)
Words: w (next word), b (beginning of word), e (end of word)
Lines: 0 (beginning of line), ^ (first non-blank character), $ (end of line)
Screen: H (top of screen), M (middle of screen), L (bottom of screen)
Scroll: Ctrl-u (up), Ctrl-d (down)
File: gg (beginning of file), G (end of file)
Line numbers: :{number}<CR> or {number}G (line {number})
Misc: % (corresponding item)
Find: f{character}, t{character}, F{character}, T{character}
find/to forward/backward {character} on the current line
, / ; for navigating matches
Search: /{regex}, n / N for navigating matches


Selection

Visual modes:

Visual: v
Visual Line: V
Visual Block: Ctrl-v
Can use movement keys to make selection.


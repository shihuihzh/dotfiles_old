colorscheme elflord  " 设置主题
set number           " 显示行号
set tabstop=4        " 设定 tab 长度为 4
set expandtab        " 空格替代Tab
" set ai             " 设置自动缩进
syntax on            " 自动语法高亮
set hlsearch         " 搜索时高亮显示被找到的文本
set showmatch        " 匹配对应符号
set ruler            " 显示状态栏标尺
if has("multi_byte")
    " UTF-8 编码
    set encoding=utf-8
    set termencoding=utf-8
    set formatoptions+=mM
    set fencs=utf-8,gbk
    if v:lang =~? '^\(zh\)\|\(ja\)\|\(ko\)'
        set ambiwidth=double
    endif
else
    echoerr "Sorry, this version of (g)vim was not compiled with +multi_byte"
endif


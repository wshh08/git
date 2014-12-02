syntax enable
syntax on
"colorscheme morning 

filetype on "检测文件的类型
filetype plugin on
filetype plugin indent on

set nocompatible "不要vim模仿vi模式，建议设置，否则会有很多不兼容的问题

set nu  " 显示行号
set sm
set autoindent "依据上面的对起格式，智能的选择对起方式，对于类似C语言编
set smartindent "设置Windows风格的C/C++自动缩进,第一行设置tab键为4个空格，第二行设置当行之间交错时使用4个空格
set cin
set hlsearch        " 高亮搜索
set ignorecase      " 搜索时忽略大小写
set nobackup        " 关闭备份
set ai              " 自动缩进
set si              " 智能缩进
set cindent         " C/C++风格缩进
set showmatch       "设置匹配模式，类似当输入一个左括号时会匹配相应的那个右括号
set vb t_vb=        "当vim进行编辑时，如果命令错误，会发出一个响声，该设
set guioptions-=T   "在编辑过程中，在右下角显示光标位置的状态行
set foldenable      " 开始折叠
set nobackup        "关闭备份
set wildmenu        " 自动补全命令时候使用菜单式匹配列表
set hlsearch        " 输入字符串就显示匹配点

" tab转化为4个字符
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4

set background=dark "设置背景色
"colorscheme torte 
"colo<torte>

set history=400  " vim记住的历史操作的数量，默认的是20
set autoread     " 当文件在外部被修改时，自动重新读取
set mouse=a      " 在所有模式下都允许使用鼠标，还可以是n,v,i,c等

set nohls
"查询时非常方便，如要查找book单词，当输入到/b时，会自动找到第一
"个b开头的单词，当输入到/bo时，会自动找到第一个bo开头的单词，依
"次类推，进行查找时，使用此设置会快速找到答案，当你找要匹配的单词
"时，别忘记回车

set incsearch
"改一个文件后，自动进行备份，备份的文件名为原文件名加“~“后缀

set noswf   " 去掉烦人的交换文件
" 去掉烦人的编辑提示
set nobackup
set writebackup

""括号自动补全
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {}<ESC>i
inoremap < <><ESC>i
inoremap " ""<ESC>i

"""""""""""""""""""""处理文本中显示乱码"""""""""""""""""""
set encoding=utf-8 
set fileencodings=utf-8,chinese,latin-1 
if has("win32") 
    set fileencoding=chinese 
else 
    set fileencoding=utf-8 
endif 
"处理菜单及右键菜单乱码 
"source $VIMRUNTIME/delmenu.vim 
"source $VIMRUNTIME/menu.vim 
""处理consle输出乱码 
language messages zh_CN.utf-8

"""""""""""""""""""""采用windows里的复制粘贴等命令,
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

"""""""""""""""""""""Vundle & YouCompelete插件""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" alternatively, pass a path where Vundle should install plugins
"let path = '~/some/path/here'
"call vundle#rc(path)

" let Vundle manage Vundle, required
Plugin 'gmarik/vundle'

" The following are examples of different formats supported.
" Keep Plugin commands between here and filetype plugin indent on.
" scripts on GitHub repos
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'tpope/vim-rails.git'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" scripts from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
Plugin 'FuzzyFinder'
" scripts not on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" ...

filetype plugin indent on     " required
"""""以下每个Bundle代表一个插件"""""

Bundle 'Valloric/ListToggle'

"The-NERD-tree:目录文件导航
Bundle 'scrooloose/nerdtree'
" \nt                 打开nerdree窗口，在左侧栏显示
nmap <leader>nt :NERDTree<CR>
let NERDTreeHighlightCursorline=1
let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.obj$', '\.o$', '\.so$', '\.egg$', '^\.git$', '^\.svn$', '^\.hg$' ]
let g:netrw_home='~/bak'
"close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primar")

"标签导航，纬度和taglist不同
Bundle 'majutsushi/tagbar'
nmap <leader>tb :TagbarToggle<CR>  " \tb 打开tagbar窗口
let g:tagbar_autofocus = 1

""""多文档编辑插件minibufexpl
Bundle 'fholgado/minibufexpl.vim'
" 多文件切换，也可使用鼠标双击相应文件名进行切换
let g:miniBufExplMapWindowNavVim    = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs  = 1
let g:miniBufExplModSelTarget       = 1
"解决FileExplorer窗口变小问题
let g:miniBufExplForceSyntaxEnable = 1
let g:miniBufExplorerMoreThanOne=2
let g:miniBufExplCycleArround=1
" buffer 切换快捷键，默认方向键左右可以切换buffer
map <C-Tab> :MBEbn<cr>
map <C-S-Tab> :MBEbp<cr>

"for file search ctrlp, 文件搜索
Bundle 'kien/ctrlp.vim'
" 打开ctrlp搜索
let g:ctrlp_map = '<leader>ff'
let g:ctrlp_cmd = 'CtrlP'
" 相当于mru功能，show recently opened files
map <leader>fp :CtrlPMRU<CR>
"set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux"
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
    \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz)$',
    \ }
"\ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
let g:ctrlp_working_path_mode=0
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1

Bundle 'Lokaltog/vim-powerline'
"if want to use fancy,need to add font patch -> git clone git://gist.github.com/1630581.git ~/.fonts/ttf-dejavu-powerline
"let g:Powerline_symbols = 'fancy'
let g:Powerline_symbols = 'unicode'

""""括号显示增强 vimrc中配置如下：""""
Bundle 'kien/rainbow_parentheses.vim'
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 40
let g:rbpt_loadcmd_toggle = 0

"""可视化的方式能将相同缩进的代码关联起来。 显可视化缩进,示对齐线。 vimrc中配置如下：

Bundle 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup = 0  " 默认关闭
let g:indent_guides_guide_size            = 1  " 指定对齐线的尺寸
let g:indent_guides_start_level 	  = 2  " 从第二层开始可视化显示缩进
""" \ig 打开/关闭 vim-indent-guides

""""将代码行最后无效的空格标红
"for show no user whitespaces
Bundle 'bronson/vim-trailing-whitespace'
map <leader><space> :FixWhitespace<cr>	" \+space去掉末尾空格

"快速插入代码片段
Bundle 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
"定义存放代码片段的文件夹 .vim/snippets下，使用自定义和默认的，将会的到全局，有冲突的会提示
let g:UltiSnipsSnippetDirectories=["snippets", "bundle/ultisnips/UltiSnips"]

""""快速注释
Bundle 'scrooloose/nerdcommenter'
let NERDSpaceDelims = 1

""""快速加环绕符
Bundle 'tpope/vim-surround'
"for repeat -> enhance surround.vim, . to repeat command
Bundle 'tpope/vim-repeat'

""""代码对齐
"for code alignment
Bundle 'godlygeek/tabular'
" \bb                 按=号对齐代码 [Tabular插件]
nmap <leader>bb :Tab /=<CR>
" \bn                 自定义对齐    [Tabular插件]
nmap <leader>bn :Tab /

""""Syntastic语法检查配置
Bundle "scrooloose/syntastic"
let g:syntastic_error_symbol = '✗'	"set error or warning signs
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_check_on_open=1
let g:syntastic_enable_highlighting = 0
"let g:syntastic_python_checker="flake8,pyflakes,pep8,pylint"
"let g:syntastic_python_checkers=['pyflakes']
"highlight SyntasticErrorSign guifg=white guibg=black

let g:syntastic_cpp_include_dirs = ['/usr/include/']
let g:syntastic_cpp_remove_include_errors = 1
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_compiler ='clang++'
let g:syntastic_cpp_compiler_options = '-std=c++11 -stdlib=libstdc++'
let g:syntastic_enable_balloons = 1	"whether to show balloons

""""快速跳转到TODO列表
Bundle 'vim-scripts/TaskList.vim'
map <leader>td <Plug>TaskList

Bundle 'Yggdroot/indentLine'
Bundle 'c.vim'

" 主题 molokai
Bundle 'tomasr/molokai'
let g:molokai_original = 1
" 配色方案
set background=light
set t_Co=256

""为YCM添加内容。
Bundle 'Valloric/YouCompleteMe'
let mapleader = ","
"""""这个leader就映射为逗号“，”

let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'   "配置默认的ycm_extra_conf.py
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR> 
"""""按,jd 会跳转到定义

let g:ycm_confirm_extra_conf=0
"""""打开vim时不再询问是否加载ycm_extra_conf.py配置

let g:ycm_collect_identifiers_from_tag_files = 1
""""""使用ctags生成的tags文件

let g:ycm_show_diagnostics_ui = 0
""""""为了兼容Systastic需要此项。。


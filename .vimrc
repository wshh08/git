autocmd!
syntax enable
syntax on
    colorscheme desert

filetype on "检测文件的类型
filetype plugin on
filetype plugin indent on

""colorscheme defalut

set nocompatible "不要vim模仿vi模式，建议设置，否则会有很多不兼容的问题
set laststatus=2

set nu  " 显示行号
set sm
set autoindent "依据上面的对起格式，智能的选择对起方式，对于类似C语言编
set smartindent "设置Windows风格的C/C++自动缩进,第一行设置tab键为4个空格，第二行设置当行之间交错时使用4个空格
set cin
set hlsearch        " 高亮搜索
set ignorecase      " 搜索时忽略大小写
set ai              " 自动缩进
set si              " 智能缩进
set cindent         " C/C++风格缩进
set showmatch       "设置匹配模式，类似当输入一个左括号时会匹配相应的那个右括号
set vb t_vb=        "当vim进行编辑时，如果命令错误，会发出一个响声，该设
set guioptions-=T   "在编辑过程中，在右下角显示光标位置的状态行
set wildmenu        " 自动补全命令时候使用菜单式匹配列表
set hlsearch        " 输入字符串就显示匹配点
set autochdir

set foldenable      " 开始折叠
set fdm=indent
set foldlevel=0
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc':'zo')<CR>
nmap <C-f> :confirm bdelete<CR>

""开启光亮光标行
set cursorline
hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white

set guifont=Consolas:h14

""设置备份相关
if has("vms")
      set nobackup      " do not keep a backup file, use versions instead
  else
        set backup      " keep a backup file
    endif
set backupext=.bak
set backupdir=~/vim/vimbackupfile

" tab转化为4个字符
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
au FileType html,vim setl shiftwidth=2 "特定类型文件缩进空格
au FileType html,vim setl tabstop=2

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif "记住上次的位置

""设置换行
set wrap
set linebreak
set tw=120
set lbr
set fo+=mB

"set background=light"设置背景色
"colo<torte>

set history=400  " vim记住的历史操作的数量，默认的是20
set autoread     " 当文件在外部被修改时，自动重新读取
set mouse=a      " 在所有模式下都允许使用鼠标，还可以是n,v,i,c等

" 光标移动到buffer的顶部和底部时保持3行距离
set scrolloff=6

set nohls
"查询时非常方便，如要查找book单词，当输入到/b时，会自动找到第一
"个b开头的单词，当输入到/bo时，会自动找到第一个bo开头的单词，依
"次类推，进行查找时，使用此设置会快速找到答案，当你找要匹配的单词
"时，别忘记回车

set incsearch
"改一个文件后，自动进行备份，备份的文件名为原文件名加“~“后缀

set noswf   " 去掉烦人的交换文件
" 去掉烦人的编辑提示
""set writebackup

let autosave=10   " 设置自动保存10s

""设置V模式平移
vnoremap < <gv
vnoremap > >gv

""括号自动补全
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {}<ESC>i
inoremap < <><ESC>i
inoremap " ""<ESC>i
inoremap ' ''<ESC>i

""自动打NERDtree文件管理。

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
unmap <C-V>
unmap <C-Y>

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
""Plugin 'tpope/vim-rails.git'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" scripts from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
""Plugin 'FuzzyFinder'
" scripts not on GitHub
""Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" ...

filetype plugin indent on     " required

"""""以下每个Bundle代表一个插件"""""
Bundle 'Valloric/ListToggle'

"The-NERD-tree:目录文件导航
Bundle 'scrooloose/nerdtree'
map <F8> :NERDTreeMirror<CR>
map <F8> :NERDTreeToggle<CR>
let NERDTreeHighlightCursorline=1
let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.obj$', '\.o$', '\.so$', '\.egg$', '^\.git$', '^\.svn$', '^\.hg$' ]
let g:netrw_home='~/bak'
" \nt                 打开nerdree窗口，在左侧栏显示
""nmap <leader>nt :NERDTree<CR>
"close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primar")
let NERDChristmasTree = 1
let NERDTreeChDirMode  = 1

"标签导航，纬度和taglist不同
Bundle 'majutsushi/tagbar'
nmap <silent> <F4> :TagbarToggle<CR>
let g:tagbar_autofocus = 1
let g:tagbar_width = 25
let g:tagbar_compact = 1
"隐藏最上方的帮助提示
let g:tagbar_updateonsave_maxlines = 1
"文件保存时自动更新tagbar

""""多文档编辑插件minibufexpl
Bundle 'fholgado/minibufexpl.vim'
" 多文件切换，也可使用鼠标双击相应文件名进行切换
"let g:miniBufExplMapWindowNavVim    = 1
"let g:miniBufExplMapWindowNavArrows = 1
"let g:miniBufExplMapCTabSwitchBufs  = 1
"let g:miniBufExplModSelTarget       = 1
"解决FileExplorer窗口变小问题
let g:miniBufExplForceSyntaxEnable = 1
let g:miniBufExplorerMoreThanOne=2
let g:miniBufExplCycleArround=1
"buffer 切换快捷键
""map <Leader>1 :MBEbn<cr>
""map <Leader>2 :MBEbp<cr>

"for file search ctrlp, 文件搜索
Bundle 'kien/ctrlp.vim'
" 打开ctrlp搜索
let g:ctrlp_map = ',,'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1
let g:ctrlp_switch_buffer = 'Et'
let g:ctrlp_user_command = 'find %s -type f'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|log|jpg|png|jpeg|pyc)$',
  \ }
" 相当于mru功能，show recently opened files
map <leader>fp :CtrlPMRU<CR>

Bundle 'Lokaltog/vim-powerline'
"if want to use fancy,need to add font patch -> git clone git://gist.github.com/1630581.git ~/.fonts/ttf-dejavu-powerline
"let g:Powerline_symbols = 'fancy'
let g:Powerline_symbols = 'unicode'
""let g:Powerline_colorscheme = 'skwp'

"""可视化的方式能将相同缩进的代码关联起来。 显可视化缩进,示对齐线。 vimrc中配置如下：
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS

Bundle 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup = 0  " 默认关闭
let g:indent_guides_guide_size            = 1  " 指定对齐线的尺寸
let g:indent_guides_start_level 	  = 2  " 从第二层开始可视化显示缩进


""" \ig 打开/关闭 vim-indent-guides
""hi IndentGuidesOdd  ctermbg=black
""hi IndentGuidesEven ctermbg=darkgrey

""""将代码行最后无效的空格标红
"for show no user whitespaces
Bundle 'bronson/vim-trailing-whitespace'
""map <leader><space> :FixWhitespace<cr>	" \+space去掉末尾空格

"快速插入代码片段
""Bundle 'SirVer/ultisnips'
""let g:UltiSnipsExpandTrigger = "<tab>"
""let g:UltiSnipsJumpForwardTrigger = "<tab>"
""let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
"定义存放代码片段的文件夹 .vim/snippets下，使用自定义和默认的，将会的到全局，有冲突的会提示
""let g:UltiSnipsSnippetDirectories=["snippets", "bundle/ultisnips/UltiSnips"]
""定义Ctags快捷键F12
map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

""""快速注释
""Bundle 'scrooloose/nerdcommenter'
let NERDSpaceDelims = 1

""""快速加环绕符
Bundle 'tpope/vim-surround'
"for repeat -> enhance surround.vim, . to repeat command
Bundle 'tpope/vim-repeat'

""""代码对齐
"for code alignment
Bundle 'godlygeek/tabular'
" \bb                 按=号对齐代码 [Tabular插件]
""nmap <leader>bb :Tab /=<CR>
" \bn                 自定义对齐    [Tabular插件]
""nmap <leader>bn :Tab /

""""Syntastic语法检查配置
Bundle "scrooloose/syntastic"
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_wq = 0

let g:syntastic_error_symbol = '☣'	"set error or warning signs
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_check_on_open=1
let g:syntastic_enable_highlighting = 0
let g:syntastic_python_checker='flake8,pyflakes,pep8,pylint'
let g:syntastic_python_checkers=['flake8']
highlight SyntasticErrorSign guifg=white guibg=black

let g:syntastic_cpp_include_dirs = ['/usr/include/']
let g:syntastic_cpp_remove_include_errors = 1
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_compiler ='clang++'
let g:syntastic_cpp_compiler_options = '-std=c++11 -stdlib=libstdc++'
let g:syntastic_enable_balloons = 1	"whether to show balloons

"" Choose a Javascript syntax checker
let g:syntastic_javascript_syntax_checker=["jshint"]
""let g:syntastic_javascript_jshint_args='--config /home/wshh08/jshintrc.json'
""let g:syntastic_javascript_jshint_exec='/home/wshh08/bin/jshint'
""let g:syntastic_javascript_jshint_conf="~/jshintrc.json"

""highlight StatusLine guifg=SlateBlue guibg=Yellow
""highlight StatusLineNC guifg=Gray guibg=White

""""快速跳转到TODO列表
""Bundle 'vim-scripts/TaskList.vim'
map <leader>td <Plug>TaskList

Bundle 'Yggdroot/indentLine'
Bundle 'c.vim'
Bundle 'mhinz/vim-startify'
"" Bundle 'airblade/vim-gitgutter'
Bundle 'hynek/vim-python-pep8-indent'

Bundle 'nvie/vim-flake8'
" 禁止PyFlakes使用QuickFix，这样在按下<F7>时会调用flake8，而有对于代码编辑时的错误仍能得到有效的提示
let g:pyflakes_use_quickfix = 0
""""配置winmanager
""Bundle 'winmanager'
""定义快捷键
""nmap <silent> <F8> :WMToggle<cr>

" 主题 molokai
""Bundle 'tomasr/molokai'
""    colorscheme molokai
""    let g:molokai_original = 1
""    let g:rehash256 = 1
""配色方案
set background=light
set t_Co=256

""为YCM添加内容。
Bundle 'Valloric/YouCompleteMe'
let mapleader = ","
"""""这个leader就映射为逗号“，”

map <silent> <leader>ss :source ~/.vimrc<cr>
map <silent> <leader>ee :e ~/.vimrc<cr>
"" autocmd! bufwritepost .vimrc source ~/.vimrc

let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'   "配置默认的ycm_extra_conf.py
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
"""""按,jd 会跳转到定义

let g:ycm_confirm_extra_conf=0
"""""打开vim时不再询问是否加载ycm_extra_conf.py配置

let g:ycm_collect_identifiers_from_tag_files = 1
""""""使用ctags生成的tags文件

let g:ycm_show_diagnostics_ui = 0
""""""为了兼容Systastic需要此项。。

""""利用winmanager配置默认布局
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1
let g:miniBufExplMoreThanOne=0

""let g:NERDTree_title="[NERDTree]"
""let g:winManagerWindowLayout="NERDTree"

""let g:javascript_conceal_function   = "ƒ"
""let g:javascript_conceal_null       = "ø"
""let g:javascript_conceal_this       = "@"
""let g:javascript_conceal_return     = "⇚"
""let g:javascript_conceal_undefined  = "¿"
""let g:javascript_conceal_NaN        = "ℕ"
""let g:javascript_conceal_prototype  = "¶"

""function! NERDTree_Start()
""    exec 'NERDTree'
""endfunction
""
""function! NERDTree_IsValid()
""    return 1
""endfunction
""

""""离开insert时将输入法切为英文, 进入时若光标下字符是中文则切输入法(仅适用于fcitx)
func! Fcitx_enter()
    if (getline('.')[col('.') - 1] >= "\x80" || getline('.')[col('.') - 2] >= "\x80")
        call system("fcitx-remote -o")
    endif
endfun
autocmd InsertLeave * call system("fcitx-remote -c")
autocmd InsertEnter * call Fcitx_enter()

""""删除行末尾空格
func! DeleteTrailingWhiteSpace()
     normal mZ
     %s/\s\+$//e
     normal `Z
endfunc
au BufWrite * if &ft != 'mkd' | call DeleteTrailingWhiteSpace() | endif

func! DiffWithSaved()
     let ft=&filetype
     diffthis
     vnew | r # | normal! 1Gdd
     diffthis
     exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . ft
endfunc
com! DiffSaved call DiffWithSaved()
nnoremap <Leader>df :call DiffWithSaved()<CR>

""""Python自动补全插件pydiction
Bundle 'git://github.com/rkulla/pydiction.git'

"pydiction 1.2 python auto complete
filetype plugin on
""""将complete-dict文件放到你自己的某个路径下，后面的配置会用到这个文件，这个文件就是记录所有的python关键词
let g:pydiction_location = '~/.vim/bundle/pydiction/complete-dict'
"defalut g:pydiction_menu_height == 15
"let g:pydiction_menu_height = 20

""Bundle 'Shougo/vimshell.vim'
""Bundle 'Shougo/vimproc.vim'
Bundle 'python_fold'
Bundle 'dbext.vim'
Bundle 'Python.vim'
Bundle 'emmet.vim'
Bundle 'visincr'

Bundle 'othree/html5.vim'
Bundle 'vim-scripts/matchit.zip'
""Bundle 'JavaScript-syntax'
Bundle 'jelera/vim-javascript-syntax'
""  au FileType javascript call JavaScriptFold()
Bundle 'jQuery'
Bundle 'itspriddle/vim-jquery'
Bundle "pangloss/vim-javascript"
  set regexpengine=1

let javascript_enable_domhtmlcss = 1

Bundle 'othree/javascript-libraries-syntax.vim'
  let g:used_javascript_libs = 'underscore,backbone'
  autocmd BufReadPre *.js let b:javascript_lib_use_jquery = 1
  autocmd BufReadPre *.js let b:javascript_lib_use_underscore = 0
  autocmd BufReadPre *.js let b:javascript_lib_use_backbone = 0
  autocmd BufReadPre *.js let b:javascript_lib_use_prelude = 0
  autocmd BufReadPre *.js let b:javascript_lib_use_angularjs = 1

Bundle 'marijnh/tern_for_vim'
Bundle 'dimasg/vim-mark'

Bundle 'sjl/gundo.vim'
nnoremap <F5> :GundoToggle<CR>
let g:gundo_preview_bottom = 1
let g:gundo_help = 0
let g:gundo_width = 25
let g:gundo_preview_height = 10

fu! SaveSess()
  execute 'mksession! ~/vim/session.vim'
  execute 'wviminfo! ~/vim/viminfo.vim'
endfunction

fu! RestoreSess()
""if filereadable('~/session.vim')
  execute 'so ~/vim/session.vim'
  execute 'rviminfo! ~/vim/viminfo.vim'
  if bufexists(1)
    for l in range(1, bufnr('$'))
      if bufwinnr(l) == -1
        exec 'sbuffer ' . l
        exec 'close'
      endif
    endfor
    exec 'b1'
  endif
""endif
""RainbowToggle
endfunction

autocmd VimLeave,BufLeave * call SaveSess()
autocmd VimEnter * call RestoreSess()

""fu! SaveSess()
""  execute 'mksession! ' . getcwd() . '/.session.vim'
""endfunction
""
""fu! RestoreSess()
""if filereadable(getcwd() . '/.session.vim')
""  execute 'so ' . getcwd() . '/.session.vim'
""  if bufexists(1)
""    for l in range(1, bufnr('$'))
""      if bufwinnr(l) == -1
""        exec 'sbuffer ' . l
""      endif
""    endfor
""  endif
""endif
""syntax on
""endfunction
""
""autocmd VimLeave * call SaveSess()
""autocmd VimEnter * call RestoreSess()

""" Quick write session with F2
""map <F2> :mksession! ~/vim_session <cr>
""" And load session with F3
""map <F3> :source ~/vim_session <cr>
""
""Bundle 'severin-lemaignan/vim-minimap'
""let g:minimap_highlight='Constant'
""Bundle 'SirVer/ultisnips'
""Bundle 'honza/vim-snippets'
""  let g:UltiSnipsSnippetDirectories=['UltiSnips']
""  let g:UltiSnipsSnippetsDir = '~/.vim/UltiSnips'
""  let g:UltiSnipsExpandTrigger = '<C-j>'
""  let g:UltiSnipsListSnippets = '<C-h>'
""  let g:UltiSnipsJumpForwardTrigger = '<C-j>'
""  let g:UltiSnipsJumpBackwardTrigger = '<C-k>'
""  inoremap <c-x><c-k> <c-x><c-k>

""Bundle 'javascript.vim'
""Bundle 'Solarized'
""colorscheme shine
""let g:solarized_termtrans = 1
""let g:solarized_termcolors = 256
""let g:solarized_contrast = "high"
""let g:solarized_visibility = "high"
""Bundle 'ervandew/supertab'
""Bundle 'godlygeek/csapprox'
"" Bundle 'colorizer'

""Bundle 'easygrep'
""Bundle 'gotcha/vimpdb'
""Bundle 'xieyu/pyclewn'
""Bundle 'klen/python-mode'

""""""括号显示增强 vimrc中配置如下：""""
Bundle 'luochen1990/rainbow'
let g:rainbow_conf = {
    \   'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
    \   'ctermfgs': ['red', 'green', 'lightblue', 'lightyellow', 'darkgreen', 'lightcyan', 'lightmagenta', 'darkblue', 'cyan'],
    \   'operators': '_,_',
    \   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
    \   'separately': {
    \       '*': {},
    \       'tex': {
    \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
    \       },
    \       'lisp': {
    \           'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
    \       },
    \       'vim': {
    \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
    \       },
    \       'html': {
    \           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
    \       },
    \       'css': 0,
    \   }
    \}
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle

nmap <leader><space> :RainbowToggle<cr>
nnoremap <leader>n :write<cr>:bn<cr>
nnoremap <leader>m :write<cr>:bp<cr>
nnoremap <leader>d :write<cr>:bd<cr>
nnoremap <leader>1 :write<cr>:b1<cr>
nnoremap <leader>2 :write<cr>:b2<cr>
nnoremap <leader>3 :write<cr>:b3<cr>
nnoremap <leader>4 :write<cr>:b4<cr>
nnoremap <leader>5 :write<cr>:b5<cr>
nnoremap <leader>6 :write<cr>:b6<cr>
nnoremap <leader>7 :write<cr>:b7<cr>
nnoremap <leader>8 :write<cr>:b8<cr>
nnoremap <leader>9 :write<cr>:b9<cr>
nnoremap <leader>0 :write<cr>:b0<cr>

set undofile
let $VIMFILES = $HOME.'/vim'
set undodir=$VIMFILES/\_undodir
set undolevels=1000

inoremap jk <esc>:write<cr>
noremap <C-Up> <C-w><Up>
noremap <C-Down> <C-w><Down>
noremap <C-Left> <C-w><Left>
noremap <C-Right> <C-w><Right>
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel


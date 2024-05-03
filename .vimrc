filetype on
filetype plugin on
set cursorline
set wrap 
set showcmd
set relativenumber
set wildmenu
set nu
set hlsearch
set incsearch
set ignorecase
set scrolloff=5
set smartcase
set encoding=UTF-8
set guifont=DroidSansMono\ Nerd\ Font\ 11
"==============键位设置======================
map S :w<CR>
map Q :q!<CR>
map sl :vsplit<CR>
map sh :split<C>
map sw :Switch
"=============插件配置========================
call plug#begin('~/.vim/autoload')
"Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install()  }}
Plug 'plasticboy/vim-markdown'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'mhinz/vim-startify'
Plug 'morhetz/gruvbox'
Plug 'iamcco/markdown-preview.vim'
Plug 'Yggdroot/indentLine'
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Valloric/YouCompleteMe'
Plug 'w0rp/ale'
Plug 'vim-autoformat/vim-autoformat'
Plug 'majutsushi/tagbar', { 'on': 'TagbarOpenAutoClose' }
Plug 'ryanoasis/vim-devicons'
"折叠代码
Plug 'tmhedberg/SimpylFold' 

"符号对齐
Plug 'godlygeek/tabular'

"添加标签
Plug 'kshenoy/vim-signature'

"变量高亮
Plug 'numirias/semshi'

"文件列表
Plug 'mbbill/undotree'

"历史版本
Plug 'junegunn/fzf.vim'

"字符切换
Plug 'AndrewRadev/switch.vim'
"Plug ''

"Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()
"----------------------------------------------------------------
  "NerdTree
noremap tt :NERDTree<CR>
noremap tq :NERDTreeClose<CR>
"markdown
nmap  <Cp>  <Plug> MarkdownPreviewToggle
let g:mkdp_markdown_css=''
noremap <F8> :MarkdownPreview<CR>
noremap <F9> :MarkdownPreviewStop<CR>
"" === You Complete ME
let g:ycm_global_ycm_extra_conf='~/home/zk/.vim/.ycm_extra_conf.py'
let g:ycm_collect_identifiers_from_tags_files=1
let g:ycm_min_num_of_chars_for_completion=2
let g:ycm_cache_omnifunc=0
let g:ycm_seed_identifiers_with_syntax=1

let g:ycm_autoclose_preview_window_after_completion=0
let g:ycm_autoclose_preview_window_after_insertion=1
let g:ycm_use_clangd = 1
let g:ycm_clangd_binary_path = '/usr/bin/clangd'
let g:ycm_key_invoke_completion = '<c-z>'
let g:ycm_semantic_triggers =  { 'c' :['re!\w{4}'],}

"----------------------------------------------------------------
colorscheme gruvbox
set bg=dark
let g:airline_theme='gruvbox'

nnoremap <silent> [oh :call gruvbox#hls_show()<CR>
nnoremap <silent> ]oh :call gruvbox#hls_hide()<CR>
nnoremap <silent> coh :call gruvbox#hls_toggle()<CR>
"
nnoremap * :let @/ = ""<CR>:call gruvbox#hls_show()<CR>*
nnoremap / :let @/ = ""<CR>:call gruvbox#hls_show()<CR>/
nnoremap ? :let @/ = ""<CR>:call gruvbox#hls_show()<CR>?
"----------------------------------------------------------------
"配置YCM

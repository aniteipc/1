syntax on 
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
"==============键位设置======================
map S :w<CR>
map Q :q!<CR>
map sl :vsplit<CR>
map sh :split<CR>

"=============插件配置========================
call plug#begin('home/zk/.vim/autoload')
"Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install()  }}
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'iamcco/markdown-preview.vim'
Plug 'preservim/nerdtree'
Plug 'Valloric/YouCompleteMe'
Plug 'w0rp/ale'
Plug 'majutsushi/tagbar', { 'on': 'TagbarOpenAutoClose' }
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
let g:ycm_autoclose_preview_window_after_completion=0
let g:ycm_autoclose_preview_window_after_insertion=1
let g:ycm_use_clangd = 1
let g:ycm_clangd_binary_path = '/usr/bin/clangd'
let g:ycm_key_invoke_completion = '<c-z>'
let g:ycm_semantic_triggers =  { 'c' :['re!\w{4}'],}

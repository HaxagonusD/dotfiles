syntax on

set hidden
set noerrorbells
set shiftwidth=2
set tabstop=2 softtabstop=2
set expandtab
set smartindent
set nu
set nowrap
set encoding=UTF-8
set smartcase
set noswapfile
set nobackup
set nowritebackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set ruler
set smarttab
set showtabline=2 
set cursorline
set number 
set numberwidth=8
set clipboard=unnamedplus    " Important for copying I think
set background=dark 
" These are for lightline 
set laststatus=2
set noshowmode
set splitbelow
set splitright
set mouse=a
set autoindent 
set t_Co=256                            " Support 256 colors
set formatoptions-=cro                  " Stop newline continution of comments
set nocompatible
set relativenumber
set foldmethod=syntax
set foldlevel=99 
set scrolloff=999
set cmdheight=1
set pastetoggle=<F12>
set nuw=8
set hlsearch
set ignorecase
set visualbell

" By default timeoutlen is 1000 ms
set timeoutlen=500

let conceallevel=0                      " So that I can see `` in markdown files

call plug#begin('~/.vim/plugged')
" Theme
Plug 'morhetz/gruvbox'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
" Git integration
Plug 'tpope/vim-fugitive'

Plug 'skanehira/preview-markdown.vim'

Plug 'mhinz/vim-startify'
" Files
Plug 'preservim/nerdtree'
Plug 'mbbill/undotree'  
Plug 'junegunn/fzf', { 'do': { -> fzf#install()  }  }
Plug 'junegunn/fzf.vim'
" Tabs and status bar
Plug 'vim-airline/vim-airline'
" Language server
Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'chiel92/vim-autoformat'
Plug 'leafgarland/typescript-vim'
" Braces
Plug 'jiangmiao/auto-pairs'
Plug 'frazrepo/vim-rainbow'
Plug 'tpope/vim-surround'
" Movement
Plug 'justinmk/vim-sneak' 
" Commenter
Plug 'preservim/nerdcommenter'
" Snippets
" Other
Plug 'liuchengxu/vim-which-key'
Plug 'ryanoasis/vim-devicons'

"Rust language formatting and other things
Plug 'rust-lang/rust.vim'

Plug 'honza/vim-snippets'

call plug#end()

autocmd! bufwritepost .vimrc source %

let g:gruvbox_contrast_dark="hard"
let g:gruvbox_italicize_comments=0
let g:gruvbox_transparent_bg=1
colorscheme gruvbox 
" UltiSnips config
"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
"This is for Sneak
" let g:sneak#s_next = 1
"This is for rainbow brackets
let g:rainbow_active = 1
"This is for coc-prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile
" this is for echodoc
let g:echodoc#enable_at_startup=1
" this is for airline tabbar
"
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='gruvbox'
" This is for jsx-pretty
let g:vim_jsx_pretty_highlight_close_tag=1

"Rust
let g:rustfmt_autosave = 1

" This is for ripgrep apparently 
if executable('rg')
    let g:rg_derive_root='true'
endif

if exists('$TMUX')
    let &t_SI .= "\<Esc>[5 q"
    " solid block
    let &t_EI .= "\<Esc>[2 q"
endif
" Block cursor when in normal mode and vertical bar  
if &term =~ '^xterm'
    " solid underscore
    let &t_SI .= "\<Esc>[5 q"
    " solid block
    let &t_EI .= "\<Esc>[2 q"
    " 1 or 0 -> blinking block
    " 3 -> blinking underscore
    " Recent versions of xterm (282 or above) also support
    " 5 -> blinking vertical bar
    " 6 -> solid vertical bar
endif
"source of most of this config
" https://www.chrisatmachine.com/Neovim/02-vim-general-settings/

" Create default mappings
let g:NERDCreateDefaultMappings = 1


" Align line-wise comment delimiters flush left instead of following code
" indentation
let g:NERDDefaultAlign = 'left'
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
"autcmd for opening windows to the right vertically
" autocmd WinNew * wincmd L
"mapping new hotkeys  
let g:mapleader = "\<Space>"

let g:preview_markdown_parser = "glow"


nnoremap <leader>j <C-W>j
nnoremap <leader>k <C-W>k
nnoremap <leader>l <C-W>l
nnoremap <leader>h <C-W>h
nnoremap <leader>ff :Files<CR> 
nnoremap <leader>fb :Buffers<CR> 
nnoremap <leader>fc :Commits<CR> 
nnoremap <leader>bd :bd!<CR> 
nnoremap <leader>bc :bufdo bwipeout<CR> 


" Fugitive Conflict Resolution
nnoremap <leader>gdd :Gdiff<CR>
nnoremap <leader>gh :diffget //2<CR>
nnoremap <leader>gl :diffget //3<CR>

nnoremap <leader>s :w<CR>
nnoremap <leader>q :q!<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>
"These are for NERDTree
nnoremap <leader>n :NERDTree<CR>
nnoremap <leader>t :NERDTreeToggle<CR>
" Fugitive
nnoremap <leader>gs :Git<CR>
" coc 
nmap <silent> gd <Plug>(coc-definition)
" K for showing documentation
nnoremap <silent> K :call <SID>show_documentation()<CR>
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" I hate escape more than anything else
inoremap jk <Esc>
inoremap kj <Esc>
imap jj <Esc>
imap kk <Esc>
" Use alt + hjkl to resize windows
nnoremap <M-j> :resize -2<CR>
nnoremap <M-k> :resize +2<CR>
nnoremap <M-h> :vertical resize -2<CR>
nnoremap <M-l> :vertical resize +2<CR>
" TAB in general mode will move to text buffer
nnoremap <TAB> :bnext<CR>
" SHIFT-TAB will go back
nnoremap <S-TAB> :bprevious<CR>
" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"



" Better tabbing i.e. doesn't quit when you want to keep tabbing
vnoremap < <gv
vnoremap > >gv
"This is for using the vim terminal 
tnoremap <Esc><Esc> <c-\><c-n>
" This is for whichkey
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
" mapping my leaders


"%bd! to delete all buffers is a useful command 
nnoremap <CR> o<Esc>
autocmd VimEnter * DoMatchParen 
autocmd InsertLeave * :redraw!

" yank into the system clipboard
let s:clip = '/mnt/c/Windows/System32/clip.exe' 
if executable(s:clip)

        augroup WSLYank
            autocmd!
            autocmd TextYankPost * call system('echo '.shellescape(join(v:event.regcontents, "\<CR>")).' | '.s:clip)
        augroup END
endif

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
" This is for tmux colors
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif
let g:fzf_layout = { 'down': '~60%' }


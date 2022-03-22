" =================== GENERAL PREFERENCES ===================

" Basic prefs
    set hlsearch incsearch	" highlight search, move cursor to matched string while typing
    set ignorecase smartcase	" ignore case when searching except when it contains an uppercase
    set modelines=0		" number of lines at the beginning and end of files checked for file-specific vars set visualbell		" flashes screen upon error instead of emitting sound
    set nobackup		" don't create 'filename~' backups
    set noswapfile		" don't create temp swp files
    set autoindent		" indent new line same as preceding line
    set showmatch		" highlight matching parens
    set nowrap			" don't wrap code when edge of screen reached
    set autochdir		" set working directory to current file 
    set noshowmode		" hides insert/normal mode message in statusline
    set cursorline		" shows cursor line
    set mouse=nicr		" enables trackpad/mouse scrolling in nvim
    set t_Co=256		" sets colorscheme to 256 bit mode
    filetype plugin on		" enables the filetype plugin
    syntax enable		" enable syntax highlighting

" Set the width and type of tab
    set shiftwidth=4
    set softtabstop=4
    set noexpandtab

" Switch cursor to line when in insert mode, and block when not
    set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
    \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
    \,sm:block-blinkwait175-blinkoff150-blinkon175

" Shows the hybrid number lines
    set number

" Automatically updates in vim if edited with other editor
    set autoread
    au FocusGained,BufEnter * :silent! !  

" Use Unicode
    set encoding=utf-8
    set fenc=utf-8
    set fencs=iso-2022-jp,euc-jp,cp932


" =================== REMAPPINGS ===================

" Move between split screens
    nnoremap <leader>b :ls<cr>:b<space>

" Remap ctrl-n to open nerdtree
    map <C-n> :NERDTreeToggle<CR>

" Remap ctrl-t to open tagbar
    nmap <C-t> :TagbarToggle<CR> 

" Remap ctrl-hjkl to switch focus of vim split-panes
    nnoremap <C-J> <C-W><C-J> 
    nnoremap <C-K> <C-W><C-K> 
    nnoremap <C-L> <C-W><C-L> 
    nnoremap <C-H> <C-W><C-H>

    nmap j <Plug>(accelerated_jk_gj)
    nmap k <Plug>(accelerated_jk_gk)


" =================== PLUGINS ===================

" Load plugins
call plug#begin('~/.config/nvim/plugged')
    " Load general plugins
    Plug 'mhinz/vim-startify'					" shows startup screen on 'nvim' with shortcuts
    Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }	" shows directory tree
    Plug 'majutsushi/tagbar'					" shows overview of file structure on :TagbarToggle
    Plug 'itchyny/lightline.vim'				" show statusbar below
    Plug 'tpope/vim-abolish' 					" substitute, search, and abbreviate multiple variants of a word 
    Plug 'tpope/vim-commentary'					" easy commenting motions 
    Plug 'tpope/vim-surround' 					" mappings to easily delete, change and add such surroundings in pairs, such as quotes, parens, etc.  
    Plug 'benmills/vimux' 					" tmux integration for vim 
    Plug 'tpope/vim-repeat' 					" repeating other supported plugins with the . command 
    Plug 'Raimondi/delimitmate'					" smart completion of delimiters like ()[]'' 
    Plug 'rhysd/accelerated-jk'					" accelerating jk/updown movement
    Plug 'UnikMask/iroh-vim'					" importing Alex's colorscheme
    Plug 'dikiaap/minimalist'					" importing minimalist colorscheme
    Plug 'neoclide/coc.nvim', {'branch': 'release'}		" code-completion and syntax highlighting
    Plug 'kevinoid/vim-jsonc'					" jsonc (json w/ comment support) syntax highlighting
    Plug 'preservim/nerdcommenter'				" comment out lines with \cc and \cu
    Plug 'sheerun/vim-polyglot'					" lanugage server bundle
call plug#end() 

" Minimalist colorscheme preferences
colorscheme minimalist	" enable minimalist colorscheme
let g:airline_theme='minimalist' " enable minimalist colorscheme for airline
let g:airline_powerline_fonts = 1 " enable minimalist colorscheme for airline
let g:airline#extensions#tabline#enabled = 1 " enable minimalist colorscheme for airline

" Startify settings
let g:startify_custom_header = [ 
    \ '  _   _ ______ ______      _______ __  __ ',
    \ ' | \ | |  ____/ __ \ \    / /_   _|  \/  |',
    \ ' |  \| | |__ | |  | \ \  / /  | | | \  / |',
    \ ' | . ` |  __|| |  | |\ \/ /   | | | |\/| |',
    \ ' | |\  | |___| |__| | \  /   _| |_| |  | |',
    \ ' |_| \_|______\____/   \/   |_____|_|  |_|',
    \ ]
let g:startify_bookmarks = [ {'a': '~/.config/nvim'}, {'b': '~/.zshrc'}, {'c': '~/Documents/scripts'} ]

" Removing COC version alert
let g:coc_disable_startup_warning = 1

" 256-color terminal
set t_Co=256

" the grog color scheme has a dark background; let VI know
" which affects various (e.g.) highlight colors
set background=dark
" use custom color scheme
colorscheme grog

set hlsearch
set incsearch
set number          " show line numbers
set scrolloff=10
" use different color scheme when using vimdiff
if &diff
    colorscheme blue
endif
set tags=tags;/
filetype indent on
set expandtab
set shiftwidth=4
set softtabstop=4
set pastetoggle=<F11>

"Ruby/Rails settings
"From: https://github.com/richoH/dotfiles/blob/master/vimrc:139,154

" This is specific to rails apps, but I will not bind it to a particular
" filetype
function! TwoSpace()
    setlocal tabstop=2
    setlocal shiftwidth=2
    setlocal softtabstop=2
endfunction
au FileType ruby call TwoSpace()
au FileType coffee call TwoSpace()
au BufNewFile,BufRead *.erb call TwoSpace()


"Enable HAProxy syntax highlighting
au BufRead,BufNewFile haproxy* set ft=haproxy

"Fix line numbers
"hi LineNr		term=underline ctermfg=Yellow					guifg=Yellow

" visual autocomplete for command menu
" e.g. :color <Tab> will visually list the color schemes available
set wildmenu

" press <comma><space> in quick succession to clear search results
nnoremap <silent> ,<space> :nohlsearch<CR>

" type ',date' to insert the current ISO 8601 date time
inoremap ,date <C-r>=strftime("\%F \%T") <CR>

" Spellcheck
function ToggleSpell()
    :set spell!
    if (&spell ==# "nospell")
        execute 'colorscheme grog'
    else
        " execute 'colorscheme murphy'
        execute 'colorscheme pablo'
    endif
endfunction
" press <Shift-Tab> to toggle spellcheck On/Off
nnoremap <S-Tab> :call ToggleSpell()<CR>
" Set the language_dialect for spellcheck
set spelllang=en_us

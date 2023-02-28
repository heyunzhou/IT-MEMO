function! myspacevim#before() abort
    let g:highlightedyank_highlight_duration = 200
    nmap m1 :%s/<C-R><C-W>/<C-R>0/g<CR>
    imap jj <esc>
    imap <C-k> <C-o>D<Right>
    "" -- NORMAL MODE --
    nmap vw viw
    nmap yw yiw
    nmap cw ciw
    nmap dw diw

    nmap vb vib
    nmap yb yib
    nmap cb cib
    nmap db dib

    nmap vB viB
    nmap yB yiB
    nmap cB ciB
    nmap dB diB

    nmap v" vi"
    nmap y" yi"
    nmap c" ci"
    nmap d" di"

    nmap v' vi'
    nmap y' yi'
    nmap c' ci'
    nmap d' di'

    nmap n nzz
    nmap N Nzz

    nmap ; yyp
    map H ^
    map L $
" set cusor shape
    if &term =~ "xterm"
        let &t_SI = "\<Esc>[6 q"
        let &t_SR = "\<Esc>[3 q"
        let &t_EI = "\<Esc>[1 q"
    endif

endfunction

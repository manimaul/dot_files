# Pasting
```
set paste
set nopaste
```


# Line numbers
```
set number
set nonumber
```


# Esc
`imap jj <esc>`


# Navigation
j,l,i,k = move left,up,down 

gg = move to top of document
G = move to bottom of document
5G = move to 5th line

H = move to top of screen
L = move to bottom of screen
M = move to middle of screen

0 = move to start of line
$ = move to end of line

e = end of word
E = end of WORD
b = previous word
B = previous WORD
w = next word
W = next WORD

# [netrw](https://shapeshed.com/vim-netrw/)
:Ex - explor in current window
:Vex - explore in a vertical window
:Sex - explore in a horizontal window


# Panes
ctrl w


# Undo
u = undo
c-r = redo


# Copy / Paste
y = yank
d = cut


# [Registers](https://www.brianstorti.com/vim-registers/)
:reg

# [Surround](https://github.com/tpope/vim-surround)
`ysiw` -> `[` = surround word with []\s
`yss` -> `( ` = surround ()\s
`yss` -> `b` = surround ()\s 
`ds` -> `[` = delete surrounding []\s
`dst` = delete surrounding tag such as `<p><\p>`\s
`cs"'` = change surround to '\s
`V` -> `S<p>` surround visual selection with `<p></p>`  


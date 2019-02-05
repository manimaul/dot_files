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
```
j, l, i, k = move left, up, down 

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
```

# [netrw](https://shapeshed.com/vim-netrw/)
```
:Ex - explor in current window
:Vex - explore in a vertical window
:Sex - explore in a horizontal window
```

# Panes
```
ctrl w
```

# Undo
```
u = undo
c-r = redo
```

# Copy / Paste
```
y = yank
d = cut
```

# [Registers](https://www.brianstorti.com/vim-registers/)
```
:reg
```

# [Surround](https://github.com/tpope/vim-surround)
```
'ysiw' -> '[' = surround word with []
'yss' -> '( ' = surround ()
'yss' -> 'b' = surround ()
'ds' -> '[' = delete surrounding []
'dst' = delete surrounding tag such as '<p><\p>'
'cs"'' = change surround to '
'V' -> 'S<p>' surround visual selection with '<p></p>'
```

# Search/Replace
```
s/foo/bar/g = change each foo to bar in the current line
%s/foo/bar/g = change earch foo to bar in all lines
'<,'s>s/foo/bar/g = change foo to bar in the visual selection
```

When searching:
```
., *, \, [, ^, and $ are metacharacters.
+, ?, |, &, {, (, and ) must be escaped to use their special function.
\/ is / (use backslash + forward slash to search for forward slash)
\t is tab, \s is whitespace (space or tab)
\n is newline, \r is CR (carriage return = Ctrl-M = ^M)
After an opening [, everything until the next closing ] specifies a /collection. Character ranges can be represented with a -; for example a letter a, b, c, or the number 1 can be matched with [1a-c]. Negate the collection with [^ instead of [; for example [^1a-c] matches any character except a, b, c, or 1.
\{#\} is used for repetition. /foo.\{2\} will match foo and the two following characters. The \ is not required on the closing } so /foo.\{2} will do the same thing.
\(foo\) makes a backreference to foo. Parenthesis without escapes are literally matched. Here the \ is required for the closing \).
```

When replacing:
```
\r is newline, \n is a null byte (0x00).
\& is ampersand (& is the text that matches the search pattern).
\0 inserts the text matched by the entire pattern
\1 inserts the text of the first backreference. \2 inserts the second backreference, and so on.
```

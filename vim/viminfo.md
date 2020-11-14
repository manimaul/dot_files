

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

{ = move paragraph back
} = move paragraph forward
( = move sentence back
) = move sentence forward
[[ = move section back
]] = move section forward
c-] = jump to ctag
c-o = jump back

fc = move to next c
Fc = mobe to previous c

c-u = scroll up 1/2 page
c-b = scroll up page
c-f = scroll down page
c-d = scroll down 1/2 page
z-ret = scroll current line to top of page
z. = scroll current line to the middle of the page
5z. = scroll the 5th line to the middle of the page
z- = scroll the current line to the bottom of the page
5z- = scroll the 5th line to the bottom of the page
```

# NerdTree
```
c-e - toggle navigation panel
```

# Panes
```
c-w - switch panes
```

# Undo
```
u = undo
c-r = redo
```


# Copy / Paste / [Registers](https://www.brianstorti.com/vim-registers/)
```
set paste
set nopaste
y = yank
d = cut
p = paste
"*yy = yank into global register (for pasting into other vim sessions)
"*p = paste from global register
"ay = yank into the a register
"ap = paste from the a register 
:reg = show registers and content
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

# Spelling

`set spell` enables spelling highlighting
`set nospell` disables spelling highlighting

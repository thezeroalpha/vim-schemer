# Schemer: a Vim colorscheme generator
## What?
This plugin defines a much simpler language for writing colorschemes, and generates a Vim colorscheme file automatically, including all necessary boilerplate.

It consists of:
* a new filetype, with the extension '.schemer'
* an autocommand for the filetype, to generate and set the colorscheme automatically whenever a Schemer file is saved. Can be disabled by setting `g:schemer_no_autocmd`.
* a command, `SchemerGenerate`, to convert a '.schemer' file into a '.vim' colorscheme file
* two mappings:
    * `<Plug>SchemerSynstack` to echo the highlight groups of the word under the cursor
    * `<Plug>SchemerEdit` to open the '.schemer' file for the current colorscheme. Assumes the '.schemer' file is in ~/.vim/colors.

## Why?
I like making my own colorschemes, I don't like dealing with Vim's syntax.
I wanted something simpler and more intuitive.

Here are some specific examples from my colorscheme.

### Example: incsearch
Vim colorscheme syntax

```vim
hi Incsearch guifg=NONE guibg=#b7d1b0 ctermfg=NONE ctermbg=151 cterm=bold gui=bold
```

Schemer syntax:

```
Incsearch NONE, #b7d1b0. bold
```

### Example: link label, storageclass, and typedef to structure
Vim colorscheme syntax

```vim
hi! link typedef structure
hi! link label structure
hi! link typedef structure
```

Schemer syntax:

```
link label,storageclass,typedef structure
```

### A full colorscheme example
Overall, Vim's syntax for colorscheme definitions feels repetitive to me, and I can't always remember the necessary boilerplate, so I made this.
A Schemer colorscheme definition is as simple as:

```
background dark
palette:
    text #333333,
    bg #e4e4e4,
    comment #f5f5f5.

Normal text, bg
Comment comment, bg. italic
link statusline,statuslinenc normal
```

In my opinion, much more readable and writable than Vimscript.

## Other alternatives
There are a few alternative colorscheme generators.
I took a look at [RNB](https://github.com/romainl/vim-rnb), but it didn't feel right for me, for a few reasons.
It depends on Ruby, and I'd rather not have any dependencies.
Also, it still feels too detailed, and there's too much writing.
That sounds like a childish complaint, but I wanted to make writing colorschemes as simple as possible for me.
Having to specify the details of every color without actually needing that level of control was too much.

However, this is mainly for me.
It might not make sense for you, and you might prefer the control you get from other colorscheme generators, which is fine.

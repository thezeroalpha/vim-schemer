# Schemer: a Vim colorscheme generator
## What?
This plugin defines a much simpler language for writing colorschemes, and generates a Vim colorscheme file automatically, including all necessary boilerplate.
It gives you an empty slate: if you don't define anything in your colors heme, you get an empty colors heme (as opposed to the default that Vim uses).

It consists of:
* a new filetype, 'schemer', with the extension '.schemer'
* a command, `SchemerGenerate`, to generate a '.vim' colorscheme file from a '.schemer' file (only accessible in files with the 'schemer' filetype)
* an autocommand for the Schemer filetype, to run `:SchemerGenerate` and switch to the colorscheme automatically, whenever a Schemer file is saved. Can be disabled by setting `g:schemer_no_autocmd`.
* two `<Plug>` mappings, with no default mapping:
    * `<Plug>SchemerSynstack` to echo the highlight groups of the word under the cursor
    * `<Plug>SchemerEdit` to open the '.schemer' file for the current colorscheme. Assumes the '.schemer' file is in ~/.vim/colors.

This plugin is not meant to be compatible with everything that can run Vim.
If you don't set `termguicolors`, the colors used will be approximations.
That's fine for me, but might not be fine for you.

It's also likely slower and less efficient than it could be.

## Why?
I like making my own colorschemes, I don't like dealing with Vim's syntax.
I wanted something simpler and more intuitive.

Here are some specific examples from my colorscheme, comparing Schemer syntax and Vim syntax.

### Example: incsearch
Vim colorscheme syntax

```vim
hi Incsearch guifg=NONE guibg=#b7d1b0 ctermfg=NONE ctermbg=151 cterm=bold gui=bold
```

Schemer syntax:

```schemer
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

```schemer
link label,storageclass,typedef structure
```

### A full colorscheme example
Overall, Vim's syntax for colorscheme definitions feels repetitive to me, and I can't always remember the necessary boilerplate, so I made this.
A Schemer colorscheme definition is as simple as:

```schemer
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

Another option is [colortemplate](https://github.com/lifepillar/vim-color template), which is pretty close to what I want. 
However, I found that it's a bit too much for my purposes, and I prefer my syntax.
If you want something that gives you more control, more compatibility, and a richer syntax, I'd recommend colortemplate. 

This plugin is mainly for me.
It might not make sense for you, and you might prefer the control you get from other colorscheme generators, which is fine.

Haskell Comment VIM **(HCV)** is a plugin for the VIM editor to interact with the Haskell Comment Command **(HCC)** line program; this enables you to annotate Haskell programs directly in VIM using features from **HCC**. [Haskell Comment Command **(HCC)**](https://github.com/arbitary/haskell-comment-command "Haskell Comment Command Line Tool") is a command-line program to annotate source code written in Haskell programming language. 

## How it works
HCV lets you add or remove annotations (`--`, `{- -}`, `-- |`) using key strokes. You can also create your own keyboard shortcuts to work with each annotation style given that your terminal emulator supports customized key mappings.  The demos below use [neovim](https://neovim.io/ "vist neovim homepage") running in [iTerm2](https://www.iterm2.com/ "iTerm2 is a replacement for Terminal and the successor to iTerm. ") terminal emulator.
### Annotate using line comment
-  To  comment out several lines  using  `--` ,  first highlight the lines you want to act upon, then press `,tl` or `⌘ + /` .  Use the same operation to uncomment lines of code.

	![](https://raw.githubusercontent.com/arbitary/asset/master/demo/haskell-comment-vim/haskell-line-comment-block.gif "how to comment, uncomment a block of text")
	
-  To comment out a single line using  `--`, move the cursor to that line, then press  press `,tl` or `⌘ + /` .  Use the same operation to uncomment a line.

	![](https://raw.githubusercontent.com/arbitary/asset/master/demo/haskell-comment-vim/haskell-line-comment-toggle-line.gif "How to comment, uncomment a single line")
	
### Annotate using nested comment
To comment out selected text using Haskell’s nested comment: `{- and -}`, first select what you want to comment out by highlighting it, then press `,tb` or `⌘ + [`. To uncomment, move the cursor to `{` or `}`,  then press `,tb` or `⌘ + [`.

![](https://raw.githubusercontent.com/arbitary/asset/master/demo/haskell-comment-vim/haskell-block-comment-toggle.gif "How to comment, uncomment using Haskell's nested comment.")

### Annotate a line using Haddock 
To comment or uncomment a line using Haddock annotation `-- |`, move the cursor to the specific line, then press `,th` or `⌘ + \`.

![](https://raw.githubusercontent.com/arbitary/asset/master/demo/haskell-comment-vim/haskell-comment-add-haddock.gif "comment, uncomment using Haddock")

## How to use it
1.  Because HCV is a plugin for the VIM editor, you need to have VIM installed. I recommend [neovim](https://neovim.io/ "Visit neo VIM homepage").
Add the following settings to your (neo)vim configuration file. If you're using neovim, that configuration file is located at: `~/.config/nvim/init.vim`. 
``` vim
let mapleader = ","
let g:enable_hs_comment_bindings = 1
```
2. Install the HCV plugin using a VIM package manager such as vim-plug. I recommend [minpac](https://github.com/k-takata/minpac "package manager").
3. Install the [HCC command line tool](https://github.com/arbitary/haskell-comment-command) by either building it from the source or downloading the executables. Download the  `HCC` command line tool and make sure you put it in a location the system can find.
4. To use keyboard shortcuts: `⌘ + /`, `⌘ + [` or `⌘ + \` need to manually set up key mappings  in your terminal emulator. Here is how to add key mappings in [iTerm2](https://www.iterm2.com/ "iTerm2 is a replacement for Terminal and the successor to iTerm. "). 

 



# My custom vim configuration, selection of plugins and color scheme

## Installation

### On Debian-like distributions

Tested on Debian 8.

```sh
sudo apt-get -y install ack-grep exuberant-ctags git vim

git clone https://github.com/lofic/dotvim.git dotvim

cd dotvim

./apply.sh
```

### On RedHat-like distributions

Tested on RHEL and Centos 7

You need some recent packages for vim, flake8, dejavu fonts...

```
yum -y install ack ctags git vim-common
yum -y install dejavu-fonts-common dejavu-sans-mono-fonts
yum -y install python-flake8 # provided with EPEL 7

git clone https://github.com/lofic/dotvim.git dotvim

cd dotvim

./apply.sh
```

### On Microsoft Windows

This section may be out of date.

#### Install vim

Download from [http://www.vim.org/download.php#pc](http://www.vim.org/download.php#pc)

Type of install : typical.

#### Install ctags

Download from [http://ctags.sourceforge.net/](http://ctags.sourceforge.net/)

In the zip file, you only need `ctags.exe`

It needs to be in the PATH. Put it for example in `%windir%`

#### Configure vim

Download the dotvim repository available at
[https://github.com/lofic/dotvim](https://github.com/lofic/dotvim)
in a zip file.

Extract it.

Copy dotvimrc to _vimrc in your home directory.

Copy dotvim to vimfiles in your home directory.

Copy bundle to vimfiles/bundle in your home directory.

You can get the value of the home directory in vim by doing :

```
:echo $HOME
```

Or at the command line in Windows :

```
echo %UserProfile%
```

#### Install the font DejaVu Sans Mono for Powerline

`DejaVu Sans Mono for Powerline.ttf` is needed for the nice looking powerline
symbols to appear in the airline status line.

Click Start, and then click Run.

Type the following command, and then click OK:

`%windir%\fonts`

On the File menu, click Install New Font.

Browse to the dotvim/fonts folder (from the zip extract above) and install the
available font.



#### Attempt at making an install batch

Why everything is always so painful on Windows ?

Install vim like described above.

Install ctags.exe like described above.

Install git.

Download git from
[http://msysgit.github.io/](http://msysgit.github.io/) and install it.

During the installation process, choose : Run git from the Windows Command
Prompt

Then :

```
SET COPYCMD=/Y
cd "%UserProfile%"
rmdir dotvim /S /Q
rmdir vimfiles /S /Q
git clone https://github.com/lofic/dotvim.git dotvim
copy dotvim\dotvimrc _vimrc
copy dotvim\dotctags ctags.cnf
mkdir vimfiles
xcopy dotvim\dotvim vimfiles /S
mkdir vimfiles\bundle
xcopy dotvim\bundle vimfiles\bundle /S
copy "dotvim\fonts\DejaVu Sans Mono for Powerline.ttf" %windir%\fonts
regedit /s dotvim\fonts\dejavu_powerline.reg
```

Unfortunately at this point you still need a reboot for the font to be taken
into consideration by the system.

## Custom Vim initializations

`.vimrc`, with favorite settings, key mappings, custom commands and comments.


## Plugins

The installed release versions are listed in bundle/releases.

### ack

Better search in source code directories.

From
[https://github.com/mileszs/ack.vim](https://github.com/mileszs/ack.vim)


### addon-mw-utils

Needed by snipmate.

From
[https://github.com/MarcWeber/vim-addon-mw-utils](https://github.com/MarcWeber/vim-addon-mw-utils)


### airline

Nice and pretty status/tabline. The pretty layout needs a specific powerline
font.

From
[https://github.com/bling/vim-airline](https://github.com/bling/vim-airline)


### asciidoc

Syntax highlighter for AsciiDoc (a lightweight markup language for text based
document generation).

From AsciiDoc, last changed in AsciiDoc 8.2.0 ATOW.

### Asciitune

My own customizations for asciidoc. Create/edit a revision history; build the
pdf document; show the pdf output.

From
[https://github.com/lofic/asciitune](https://github.com/lofic/asciitune)

### autoclose

Inserts matching bracket, paren, brace or quote

From
[https://github.com/vim-scripts/AutoClose](https://github.com/vim-scripts/AutoClose)

### ctrlp

Full path fuzzy file, buffer, mru, tag, ... finder written in pure Vimscript
(unlike command-t, so it runs everywhere straight away).

From
[https://github.com/kien/ctrlp.vim/](https://github.com/kien/ctrlp.vim)


### cucumber

Provides syntax highlighting, indenting, and a filetype plugin for Cucumber,
the acceptance testing framework.

From
[https://github.com/tpope/vim-cucumber](https://github.com/tpope/vim-cucumber)


### deletetrailingwhitespace

Deletes whitespace at the end of each line, on demand or automatically.

From
[https://github.com/vim-scripts/DeleteTrailingWhitespace](https://github.com/vim-scripts/DeleteTrailingWhitespace)

### dragvisuals

Drag visual blocks around.

From
[https://github.com/thoughtstream/Damian-Conway-s-Vim-Setup/blob/master/plugin/dragvisuals.vim](https://github.com/thoughtstream/Damian-Conway-s-Vim-Setup/blob/master/plugin/dragvisuals.vim)

Demo : Damian Conway, "More Instantly Better Vim" - OSCON 2013

### easytags

Automated tag file generation and syntax highlighting of tags in Vim.
Jump to the definition of any identifier using the Control-] mapping.

From
[https://github.com/xolox/vim-easytags](https://github.com/xolox/vim-easytags)


### endwise

Helps to end certain structures automatically, for ruby, bash, etc.

From
[https://github.com/tpope/vim-endwise](https://github.com/tpope/vim-endwise)


### flake8

Pyflakes, Pep8 and mccabe code complexity checker for Vim, bundled with latest
libraries for easy installation.

From
[https://github.com/andviro/flake8-vim](https://github.com/andviro/flake8-vim)

### fontsize

Adjust Gvim font size via keypresses.

From
[https://github.com/drmikehenry/vim-fontsize](https://github.com/drmikehenry/vim-fontsize)

### fugitive

A Git wrapper.

From
[https://github.com/tpope/vim-fugitive](https://github.com/tpope/vim-fugitive)

v2 is needed to display the current Git branch with the airline plugin.


### jedi

Python autocompletion and pydoc support.

From
[https://github.com/davidhalter/jedi-vim](https://github.com/davidhalter/jedi-vim)

### json

Syntax highlighting for json. Distinct highlighting of keywords vs values, JSON-specific
(non-JS) warnings, quote concealing.

From
[https://github.com/elzr/vim-json](https://github.com/elzr/vim-json)


### mcollective

MCollective ddl snippets. See the snipmate plugin below for a definition of snippet.

From
[https://raw.github.com/puppetlabs/marionette-collective/master/ext/vim](https://raw.github.com/puppetlabs/marionette-collective/master/ext/vim)


### mediawiki

MediaWiki/Wikimedia syntax highlighting and snippets.

From
[https://github.com/atdt/vim-mediawiki](https://github.com/atdt/vim-mediawiki)


### minibufexpl

Elegant buffer explorer.

From
[https://github.com/techlivezheng/vim-plugin-minibufexpl](https://github.com/techlivezheng/vim-plugin-minibufexpl)


### misc

Requirement for the easytags plugin.

From
[https://github.com/xolox/vim-misc](https://github.com/xolox/vim-misc)


### nerdtree

A file tree explorer.

From
[https://github.com/scrooloose/nerdtree](https://github.com/scrooloose/nerdtree)


### octopress

Syntax highlighting for Octopress post and page files. Both Markdown and Textile
modes are supported.

From
[https://github.com/tangledhelix/vim-octopress](https://github.com/tangledhelix/vim-octopress)


### pathogen

Plugin management.Makes it super easy to install plugins and runtime files in
their own private directories.

From
[https://github.com/tpope/vim-pathogen](https://github.com/tpope/vim-pathogen)


### puppet

Syntax highlighting and other stuff for puppet.

From
[https://github.com/ajf/puppet-vim](https://github.com/ajf/puppet-vim)

Note : I should give a try to [https://github.com/rodjek/vim-puppet](https://github.com/rodjek/vim-puppet)


### rooter

Changes the working directory to the project root (in particular for VCS
projects) when you open a file.

From
[https://github.com/airblade/vim-rooter](https://github.com/airblade/vim-rooter)


### ruby

Syntax highlighting; automatic, smart indenting; compiler plugins;
auto completion for Ruby.

From
[https://github.com/vim-ruby/vim-ruby](https://github.com/vim-ruby/vim-ruby)


### scrollcolors

A color scheme scroller/chooser/browser.

From
[https://github.com/vim-scripts/ScrollColors](https://github.com/vim-scripts/ScrollColors)


### snipmate

Provides some snippet features.
A snippet is a trigger word that will automatically expand to a full block of
code or a piece of often-typed text. You can set variables in the snippets.

From
[https://github.com/garbas/vim-snipmate](https://github.com/garbas/vim-snipmate)


### snippets

Collection of snipmate snippets for various programming languages. See snipmate
above.

From
[https://github.com/honza/vim-snippets](https://github.com/honza/vim-snippets)


### surround

Provides mappings to easily delete, change and add surroundings (parentheses,
brackets, quotes, XML tags, and more) in pairs.

From
[https://github.com/tpope/vim-surround](https://github.com/tpope/vim-surround)


### syntastic

Runs files through external syntax checkers then highlights and displays any
resulting errors.

From
[https://github.com/scrooloose/syntastic](https://github.com/scrooloose/syntastic)


### tabular

Text filtering and alignment. Nice for code, tables and data structures.

From
[https://github.com/godlygeek/tabular](https://github.com/godlygeek/tabular)

### tagbar

Browse the tags of source code files. It provides a sidebar that displays the
ctags-generated tags of the current file, ordered by scope (i.e. classes,
methods, functions...).

From
[https://github.com/majutsushi/tagbar](https://github.com/majutsushi/tagbar)

### taglist

A source code browser plugin. Uses exuberant ctags to parse source code files.

From
[http://sourceforge.net/projects/vim-taglist/](http://sourceforge.net/projects/vim-taglist/)

### tlib

Needed by snipmate.

From
[https://github.com/tomtom/tlib_vim](https://github.com/tomtom/tlib_vim)

### unimpaired

I use it for bubbling text (exchange lines, line up or down), but it provides
many more mapping pairs.

From
[https://github.com/tpope/vim-unimpaired](https://github.com/tpope/vim-unimpaired)

### visincr

Facilitates making a column of increasing or decreasing numbers, dates, or
daynames.

From
[https://github.com/vim-scripts/VisIncr](https://github.com/vim-scripts/VisIncr)



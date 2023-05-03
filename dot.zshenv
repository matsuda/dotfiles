# for Charset
export LANG=ja_JP.UTF-8

# ANSI Color
export LSCOLORS=gxfxcxdxbxegedabagacad

export BLOCKSIZE=k

# PATH
######################################
# homebrew
######################################
# for Apple silicon
export PATH="/opt/homebrew/bin:$PATH"
# for Intel
#export PATH=/usr/local/bin:$PATH

# LV
if test -x /usr/local/bin/lv; then
  PAGER=/usr/local/bin/lv; export PAGER
  LV="-E'$EDITOR +%d'"; export LV
else
  PAGER=/usr/bin/less; export PAGER
fi
export LESSCHARSET=utf-8

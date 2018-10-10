#!/usr/bin/fish
# import aliases
. ~/.aliases

# Always use neovim
if command -v nvim > /dev/null
  alias vim='nvim'
end

# vi bindings on the terminal
# NOTE: if using fish < 2.3 then you'll need to take the following steps to
# acheive this:
#
# mkdir ~/.config/fish/functions
# touch ~/.config/fish/functions/fish_user_key_bindings.fish
#
# then edit it to contain the following:
#
# function fish_user_key_bindings
#  fish_vi_key_bindings
# end
fish_vi_key_bindings

# If using terminology, create an appropriate alias and set transparency to 80
# term_emu="/"(ps -f -p (cat /proc/(echo %self)/stat | cut -d \  -f 4) | tail -1 | sed 's/^.* //'
# if $term_emu =~ "terminology"
#   # The fullscreen option doesn't work in Cinnamon. 150 col x 55 lines is a
#   # reasonably large starting geometry, can max with mouse or keyboard after
#   # opening.
#   alias bigt='terminology -g 150x75 -S v-h'
#   tyalpha 80
#   function newt
#     terminology $argv > /dev/null ^&1
#   end
# end


function randompass
  set LC_ALL C
  if count $argv > /dev/null
    set n $argv
  else
    set n 15
  end
  tr -dc 'A-Za-z0-9!"#$%&'\''()*+,-./:;<=>?@[\]^_{|}~' </dev/urandom | head -c $n; echo
end

function vimd
  vim -c 'colorscheme dracula' -c 'set background=dark' $argv
end

set fish_greeting 'It\'s dangerous to go alone. Take this with you.'


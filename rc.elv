# DO NOT EDIT THIS FILE DIRECTLY
# This is a file generated from a literate programing source file located at
# https://github.com/zzamboni/dot-elvish/blob/master/rc.org.
# You should make any changes there and regenerate it from Emacs org-mode using C-c C-v t

E:GOPATH = ~/Personal/devel/go/
paths = [
  ~/bin
  $E:GOPATH/bin
  ~/Dropbox/Personal/devel/hammerspoon/spoon/bin
  ~/.gem/ruby/2.4.0/bin
  /opt/X11/bin
  /Library/TeX/texbin
  /usr/local/bin
  /usr/local/sbin
  /usr/sbin
  /sbin
  /usr/bin
  /bin
]

use epm

epm:install &silent-if-installed=$true   \
  github.com/zzamboni/elvish-modules     \
  github.com/zzamboni/elvish-completions \
  github.com/zzamboni/elvish-themes      \
  github.com/xiaq/edit.elv               \
  github.com/muesli/elvish-libs

use re

use readline-binding

edit:insert:binding[Alt-Backspace] = $edit:kill-small-word-left~

edit:insert:binding[Alt-d] = { edit:move-dot-right-word; edit:kill-word-left }

use github.com/muesli/elvish-libs/git

use github.com/zzamboni/elvish-modules/alias

alias:new dfc e:dfc -W -l -p -/dev/disk1s4,devfs
alias:new ls e:ls --color=auto
alias:new more less
alias:new v vagrant

use github.com/zzamboni/elvish-modules/nix
nix:multi-user-setup

use github.com/zzamboni/elvish-completions:git

use github.com/zzamboni/elvish-completions:vcsh

use github.com/zzamboni/elvish-completions:cd

use github.com/zzamboni/elvish-themes/chain
chain:bold-prompt = $true

edit:-prompts-max-wait = 0.03

use github.com/zzamboni/elvish-modules/proxy
proxy:host = "http://proxy.corproot.net:8079"

proxy:test = {
  and ?(test -f /etc/resolv.conf) \
  ?(egrep -q '^(search|domain).*corproot.net' /etc/resolv.conf)
}

use github.com/zzamboni/elvish-modules/long-running-notifications

use narrow
narrow:bind-trigger-keys &location=Alt-l &lastcmd=""

use github.com/zzamboni/elvish-modules/bang-bang

use github.com/zzamboni/elvish-modules/dir
alias:new cd "use github.com/zzamboni/elvish-modules/dir; dir:cd"
alias:new cdb "use github.com/zzamboni/elvish-modules/dir; dir:cdb"

edit:insert:binding[Alt-i] = $dir:history-chooser~

edit:insert:binding[Alt-b] = $dir:left-word-or-prev-dir~
edit:insert:binding[Alt-f] = $dir:right-word-or-next-dir~

use github.com/zzamboni/elvish-modules/terminal-title

private-loaded = ?(use private)

use github.com/zzamboni/elvish-modules/atlas

use github.com/xiaq/edit.elv/smart-matcher
edit:completion:matcher[''] = $smart-matcher:match~

E:LESS = "-i -R"

E:EDITOR = "vim"

E:LC_ALL = "en_US.UTF-8"

use github.com/zzamboni/elvish-modules/util

-exports- = (alias:export)

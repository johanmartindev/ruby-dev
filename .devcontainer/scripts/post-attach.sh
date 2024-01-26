#!/bin/bash
set -xe
export GPG_TTY=$(tty)
rvm use default
if git config --global gpg.ssh.program; then
  echo "Unsetting gpg.ssh.program"
  git config --global --unset gpg.ssh.program
fi
exit

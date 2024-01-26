#!/bin/bash
set -xe
rvm use default
git config --global --add safe.directory /workspace
if git config --global gpg.ssh.program; then
  echo "Unsetting gpg.ssh.program"
  git config --global --unset gpg.ssh.program
fi
exit

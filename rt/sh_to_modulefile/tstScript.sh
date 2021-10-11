#!/bin/bash
# -*- shell-script -*-

OLD_IFS=$IFS
IFS=:
NEW_PATH=
for dir in $PATH; do
  if   [[ $dir =~ /.dotnet/ ]]; then
    :
  elif [[ $dir =~ /.config/ ]]; then
    :
  elif [[ $dir =~ /.local/ ]]; then
    :
  else
    NEW_PATH=$NEW_PATH:$dir
  fi
done
IFS=$OLD_IFS

NEW_PATH=${NEW_PATH#:}

if [ "${NO_SHELL_FUNCTIONS:-}" != yes ]; then
   fooFunc ()
   {
     echo "arg1: $1"
   }  
fi

alias fooAlias='foobin -q -l'

PATH=$testDir/bin:$NEW_PATH:$testDir/sbin

export TST_SCRIPT=1

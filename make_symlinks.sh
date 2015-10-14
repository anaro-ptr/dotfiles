#!/bin/sh

dots_dir=$(cd $(dirname $0); pwd)
script_name=${0##*/}
for e in `ls $dots_dir`
do
  if [[ $script_name != $e ]]; then
    ln -nfs $dots_dir/$e $HOME/.$e
  fi
done

exit 0

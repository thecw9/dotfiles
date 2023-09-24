#/bin/bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}

run swhkd &

echo 'Xft.dpi: 144' | xrdb -merge

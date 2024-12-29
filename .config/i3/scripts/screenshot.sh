#/bin/sh

# create file directory
mkdir -p ~/Pictures/Screenshots
file=~/Pictures/Screenshots/$(date +'%Y-%m-%d-%H%M%S.png')

# screen shot with grim and save to clipboard and file
case $1 in
full)
  grim - | tee $file | wl-copy
  ;;
select)
  grim -g "$(slurp)" - | tee $file | wl-copy
  ;;
edit)
  grim -g "$(slurp)" - | swappy -f -
  ;;
*)
  grim -g "$(slurp)" - | wl-copy
  ;;
esac

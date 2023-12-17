#/bin/sh

# create file directory
mkdir -p ~/Pictures/Screenshots
file=~/Pictures/Screenshots/$(date +'%Y-%m-%d-%H%M%S.png')
tex_file=$file.tex

# screen shot with grim and save to clipboard and file
grim -g "$(slurp)" - | tee $file | wl-copy
# pix2tex until stop to save to file
pix2tex $file >$tex_file && notify-send "OCR finished"

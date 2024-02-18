unmute() {
  # find the sound card index for HDA Intel PCH
  SOUND_CARD_INDEX=$(aplay -l | grep -m 1 "HDA Intel PCH" | awk '{print $2}' | sed 's/[^0-9]*//g')
  if [ -z "$SOUND_CARD_INDEX" ]; then
    echo "Sound card not found"
    return
  fi
  amixer -c $SOUND_CARD_INDEX set Master unmute > /dev/null
  amixer -c $SOUND_CARD_INDEX set Master 0dB > /dev/null
  amixer -c $SOUND_CARD_INDEX set Headphone unmute > /dev/null
  amixer -c $SOUND_CARD_INDEX set Headphone,0 0dB > /dev/null
  amixer -c $SOUND_CARD_INDEX set Headphone,1 unmute > /dev/null
  amixer -c $SOUND_CARD_INDEX set Headphone,1 0dB > /dev/null
}

# unmute

eval "$(zoxide init zsh)"

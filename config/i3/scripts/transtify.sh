engine="google"
transout=$(crow --brief --speak-source --speak-translation --translation zh-CN --engine "$engine" $(xsel -op))
# transout=$(trans -b -sp -p -t zh -e "$engine" "$(xsel -op)")
notify-send "$transout"

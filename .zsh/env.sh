export EDITOR='nvim'
export VISUAL='nvim'
export BROWSER='microsoft-edge-stable'

if [ -d "$HOME/.bin" ]; then
  PATH="$HOME/.bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ]; then
  PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/go/bin" ]; then
  PATH="$HOME/go/bin:$PATH"
fi

export JAVA_HOME=/usr/lib/jvm/java-8-openjdk
export PATH=$PATH:$JAVA_HOME/bin

export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
  --height 40%
  --color=fg:#d0d0d0,fg+:#d0d0d0,bg:#2c2727,bg+:#ad27ad
  --color=hl:#5f87af,hl+:#5fd7ff,info:#afaf87,marker:#87ff00
  --color=prompt:#d7005f,spinner:#af5fff,pointer:#af5fff,header:#87afaf
  --color=gutter:#2c2727,border:#fceeee,scrollbar:#030303,label:#aeaeae
  --color=query:#d9d9d9
  --border="rounded" --border-label="" --preview-window="border-rounded" --prompt="> "
  --marker=">" --pointer=">" --separator="─" --scrollbar="│"
  --layout="reverse"'

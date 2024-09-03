# Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# 开启补全菜单选择
zstyle ':completion:*' menu select

# 高亮显示补全匹配
# zstyle ':completion:*' list-colors 'yes=0:47:2:5' 'no=0:37:2' 'fi=0:0:2' 'di=0;34'

# 补全时显示描述
zstyle ':completion:*' verbose yes

# 文件补全忽略大小写
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# 目录补全时忽略/
zstyle ':completion::complete:*' special-dirs true

# 更好地处理补全顺序
zstyle ':completion:*' group-name ''

# 更简洁的补全提示
zstyle ':completion:*:default' list-prompt '%S%M matches%s'

# 定义补全时的颜色
zstyle ':completion:*:matches' 'original' 'matched' 'colored' 'highlight'

# 设置匹配项的颜色
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'

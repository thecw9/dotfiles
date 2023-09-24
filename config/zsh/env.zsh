export EDITOR='nvim'
export VISUAL='nvim'
export BROWSER='microsoft-edge-stable'

if [ -d "$HOME/.bin" ] ;
  then PATH="$HOME/.bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ;
  then PATH="$HOME/.local/bin:$PATH"
fi


export JAVA_HOME=/usr/lib/jvm/java-8-openjdk
export PATH=$PATH:$JAVA_HOME/bin

export OPENAI_API_KEY='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'

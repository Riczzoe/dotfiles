bindkey -M viins '^r' history-incremental-search-backward
bindkey -M vicmd '^r' history-incremental-search-backward

source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh

export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
  --color=fg:#000000,fg+:#000000,bg:#F5F5F5,bg+:#C7C8CC
  --color=hl:#0000FF,hl+:#0000FF,info:#8839ef,marker:#7287fd
  --color=prompt:#8839ef,spinner:#af5fff,pointer:#af5fff,header:#db0231
  --color=gutter:#f5f5f5,border:#262626,label:#aeaeae,query:#008000
  --preview-window="border-rounded" --prompt="> " --marker=">" --pointer=""
  --separator="-" --scrollbar=""'

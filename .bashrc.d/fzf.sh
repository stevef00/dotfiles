if type fzf >/dev/null 2>&1; then
  FZF_CTRL_T_COMMAND=""
  eval "$(fzf --bash)"
  export FZF_DEFAULT_OPTS="\
    --color=bg+:#414559,bg:-1,spinner:#F2D5CF,hl:#E78284 \
    --color=fg:#C6D0F5,header:#E78284,info:#CA9EE6,pointer:#F2D5CF \
    --color=marker:#BABBF1,fg+:#C6D0F5,prompt:#CA9EE6,hl+:#E78284 \
    --color=selected-bg:#51576D \
    --color=border:#737994,label:#C6D0F5"
  export FZF_CTRL_R_OPTS="--exact"
  #export FZF_CTRL_R_OPTS="--exact --color='bg:#4B4B4B,bg+:#3F3F3F,info:#BDBB72,border:#6B6B6B,spinner:#98BC99' --color='hl:#719872,fg:#D9D9D9,header:#719872,fg+:#D9D9D9' --color='pointer:#E12672,marker:#E17899,prompt:#98BEDE,hl+:#98BC99'"
  if [ -f ~/.config/fzf/fzf-git.sh ]; then
    source ~/.config/fzf/fzf-git.sh
  fi
fi


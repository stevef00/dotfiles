if type fzf >/dev/null 2>&1; then
  FZF_CTRL_T_COMMAND="" eval "$(fzf --bash)"
  export FZF_CTRL_R_OPTS="--exact --color='bg:#4B4B4B,bg+:#3F3F3F,info:#BDBB72,border:#6B6B6B,spinner:#98BC99' --color='hl:#719872,fg:#D9D9D9,header:#719872,fg+:#D9D9D9' --color='pointer:#E12672,marker:#E17899,prompt:#98BEDE,hl+:#98BC99'"
fi

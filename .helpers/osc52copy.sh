#!/usr/bin/env bash
# read from stdin into a variable
buf=$(cat)

# base64-encode the buffer
buf_b64=$(printf %s "$buf" | base64 | tr -d '\n')

# OSC 52 sequence: ESC ] 52 ; c ; <base64 data> BEL
printf "\033]52;c;${buf_b64}\a" > /tmp/out

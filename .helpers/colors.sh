#!/bin/env bash
for i in {0..255} ; do
    printf "\x1b[38;5;%smcolor%s\n" "${i}" "${i}"
done

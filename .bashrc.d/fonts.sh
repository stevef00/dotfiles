# POC, not ready to be active
#
#if [[ ! -d ~/.local/share/fonts ]]; then
#    mkdir -p ~/.local/share/fonts
#fi
#
#if [[ ! -d ~/.local/share/fonts/Hack ]]; then
#    mkdir -p ~/.local/share/fonts/Hack
#    (
#        cd ~/.local/share/fonts/Hack
#	echo "Downloading Hack nerd font..."
#	wget -O- \
#            https://github.com/ryanoasis/nerd-fonts/releases/download/v3.5.1/Hack.tar.xz \
#	    | tar Jxvf -
#	fc-cache
#    )
#fi

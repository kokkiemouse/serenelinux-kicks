# fedora-livecd-xfce-ja_JP.ks
#
# Description:
# - Japanese Fedora Live Spin with the Xfce Desktop Environment
#
# Maintainer(s):
# - Shintaro Fujiwara <shintaro.fujiwara@miraclelinux.com>

%include fedora-live-xfce.ks

# lang ja_JP.UTF-8
keyboard jp
timezone Asia/Tokyo

%packages
langpacks-ja
fcitx
fcitx-configtool
fcitx-anthy
fcitx-qt5

%end

%post
cp -rf /usr/share/serenekun/etc /
cat > /etc/X11/xorg.conf.d/00-keyboard.conf << "EOF"
# Read and parsed by systemd-localed. It's probably wise not to edit this file
# manually too freely.
Section "InputClass"
        Identifier "system-keyboard"
        MatchIsKeyboard "on"
        Option "XkbLayout" "jp"
        Option "XkbModel" "jp106"
EndSection
EOF
%end
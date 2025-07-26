dealing with this started getting hard again

on Micro I install the following plugins:
- editorconfig  
- quoter  

Reproducing the setup (the full thing, the riced desktop you can use with much
less stuff. This is just an annotation so I can remember how to reproduce my
computer):
- ghostty  
- edk2-shell  
- engrampa  
- fail2ban  
- ffmpegthumbnailer  
- firefox  
- fuzzel  
- geogebra-6-bin  
- gnome-themes-extra  
- gnu-free-fonts  
- greetd  
- greetd-tuigreet  
- gsmartcontrol  
- gst-libav  
- gst-plugins-good  
- gvfs-afc  
- gvfs-gphoto2  
- htop  
- imv  
- inter-font  
- i3status  
- libguestfs  
- libimobiledevice  
- libnotify  
- libreoffice-fresh  
- logisim-evolution-bin  
- mako  
- man-pages  
- mandoc  
- mate-calc  
- moreutils  
- nemo  
- noto-fonts*  
- obs-studio  
- otf-font-awesome  
- otf-geist-mono-nerd  
- otf-ipafont  
- otf-latin-modern  
- otf-latin-modern-math  
- papirus-icon-theme  
- pavucontrol  
- pipewire-{alsa,audio,pulse,v4l2}  
- qbittorrent  
- qemu-full  
- qt5-wayland  
- qt6-wayland  
- quodlibet  
- sl  
- smartmontools  
- sudo  
- sway  
- swaylock  
- swww  
- tela-circle-icon-theme-all  
- thunderbird  
- tmux  
- ttf-bitstream-vera  
- ttf-dejavu  
- ttf-hack  
- ttf-ibm-plex  
- ttf-liberation  
- ttf-linux-libertine  
- tumbler  
- usbmuxd  
- wget  
- wireplumber  
- wl-clipboard  
- xdg-desktop-portal-gnome  
- xdg-desktop-portal-wlr  
- xdg-utils  
- xorg-xhost  
- xwayland-satellite  
- yay  
- yt-dlp  

Other annotations:
- Run `xhost +SI:localuser:root` to use `sudo` on wayland.
- Use gpg with the `/usr/bin/pinentry-tty` pinentry.
- My setup uses mostly stuff from systemd when available: systemd-network,
  systemd-resolved, systemd-boot. Still didn't switched to `run0` because
  `base-devel` depends on `sudo` anyways.
- Add:
  ```
  [Settings]
  gtk-hint-font-metrics=true
  ```
  To gtk4 `settings.ini` so it actually does hinting.

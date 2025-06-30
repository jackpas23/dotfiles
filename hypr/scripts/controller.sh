if [[ -z $1 ]]; then
  echo "No argument passed."
  exit
else
  echo "moving on"
fi

pwn_kitty() {
  cp ~/.config/kitty/pwn/pwn.conf ~/.config/kitty/current-theme.conf
  cp ~/.config/waybar/pwn/pwn-config ~/.config/waybar/config
  cp ~/.config/waybar/pwn/pwn-style.css ~/.config/waybar/style.css
  pkill waybar
  pkill kitty
  kitty &
  waybar &
  feh /home/flaxo/.config/waybar/scripts/mindmaps/mindmap_ad_dark_classic_2025.03.excalidraw.svg -F -s &
}
homelab_kitty() {
  cp ~/.config/kitty/homelab/homelab.conf ~/.config/kitty/current-theme.conf
  cp ~/.config/waybar/homelab/homelab-config ~/.config/waybar/config
  cp ~/.config/waybar/homelab/homelab-style.css ~/.config/waybar/style.css
  pkill waybar
  pkill kitty
  kitty &
  waybar &
}

case "$1" in
1)
  swww img ~/.config/hypr/pwn/swww/nickleback.png --resize stretch
  cp ~/.config/hypr/pwn/hacking-hypr.conf ~/.config/hypr/hyprland.conf
  pwn_kitty
  echo "Hacking config applied"
  ;;
2 | 3)
  swww img ~/.config/hypr/homelab/swww/monalisa.png
  cp ~/.config/hypr/homelab/homelab-hypr.conf ~/.config/hypr/hyprland.conf
  homelab_kitty
  echo "Homelab config applied"

  ;;
*)
  echo "your an idiot"
  ;;
esac
exit

<div align="center">
<h1> Material Design Hyprland </h1>
<p><b><u>// My Personal Hyprland dotfiles //</u></b></p>
<br><img src="https://raw.githubusercontent.com/POP303U/material/main/assets/Perltone_Preview.png"/><br></div>

## Installation

The installation script is made for Arch, but **could** work on some Arch based distros with **systemd**.
It only currently works with AMD Cards with experimental Nvidia support.

After a minimal Arch install clone and execute -

```sh
sudo pacman -Syu git
git clone https://github.com/POP303U/material ~/Material
cd ~/Material/setup-hypr
./install
```

It is not recommended to mix and match this with other rices / distros since it will break 99.9% of the time because of package conflicts / clashing configuration paths.

### Updating
To update material you will need to pull the latest changes from github and restore the configs by doing -

```sh
cd ~/material/setup-hypr
git pull
./install
```

## Custom created themes with Thememanager

* Gruvbox-Picom
<br><img src="https://raw.githubusercontent.com/POP303U/material/main/assets/Gruvbox-Picom.png"/><br></div>

* Material-Design
<br><img src="https://raw.githubusercontent.com/POP303U/material/main/assets/Material-Design.png"/><br></div>

* Frosty-Peaks (Uses Perltone for color generation)
<br><img src="https://raw.githubusercontent.com/POP303U/material/main/assets/Frosty-Peaks.png"/><br></div>

## Keybindings

| Keys | Action |
| :--  | :-- |
| <kbd>Alt</kbd> + <kbd>Enter</kbd>| launch kitty terminal
| <kbd>Alt</kbd> + <kbd>Shift</kbd> + <kbd>W</kbd>| launch firefox
| <kbd>Alt</kbd> + <kbd>Shift</kbd> + <kbd>E</kbd> | launch dolphin
| <kbd>Alt</kbd> + <kbd>Shift</kbd> + <kbd>Q</kbd>| quit active/focused window
| <kbd>Alt</kbd> + <kbd>Shift</kbd> + <kbd>M</kbd>| quit hyprland session
| <kbd>Alt</kbd> + <kbd>Shift</kbd> + <kbd>Space</kbd> | toggle window on focus to float
| <kbd>Ctrl</kbd> + <kbd>Win</kbd> + <kbd>L</kbd> | lock screen (hyprlock)
| <kbd>Alt</kbd> + <kbd>Ctrl</kbd> + <kbd>R</kbd> | rice select menu
| <kbd>Alt</kbd> + <kbd>Ctrl</kbd> + <kbd>C</kbd> | open clipboard history
| <kbd>Alt</kbd> + <kbd>D</kbd> | launch desktop applications
| <kbd>Alt</kbd> + <kbd>S</kbd> | launch material settings menu
| <kbd>Alt</kbd> + <kbd>F12</kbd> | mute audio output (toggle)
| <kbd>Alt</kbd> + <kbd>F11</kbd>| increase volume
| <kbd>Alt</kbd> + <kbd>F10</kbd>| decrease volume
| <kbd>Alt</kbd> + <kbd>F</kbd> | make current application fullscreen
| <kbd>Alt</kbd> + <kbd>M</kbd> | launch logout menu (wlogout)
| <kbd>Win</kbd> + <kbd>Win</kbd> + <kbd>→</kbd> | next wallpaper
| <kbd>Win</kbd> + <kbd>Win</kbd> + <kbd>←</kbd> | previous wallpaper
| <kbd>Win</kbd> + <kbd>Win</kbd> + <kbd>↑</kbd> | next waybar style
| <kbd>Win</kbd> + <kbd>Win</kbd> + <kbd>↓</kbd> | previous waybar style
| <kbd>Shift</kbd> + <kbd>Print</kbd>  | select area for a screenshot
| <kbd>Alt</kbd> + <kbd>P</kbd> | launch hex colorpicker (hyprpicker)
| <kbd>Alt</kbd> + <kbd>RightClick</kbd> | resize the window
| <kbd>Alt</kbd> + <kbd>LeftClick</kbd> | change the window position
| <kbd>Alt</kbd> + <kbd>MouseScroll</kbd> | cycle through workspaces
| <kbd>Alt</kbd> + <kbd>Shift</kbd> + <kbd>←</kbd><kbd>→</kbd><kbd>↑</kbd><kbd>↓</kbd>| move windows
| <kbd>Alt</kbd> + <kbd>Shift</kbd> + <kbd>Ctrl</kbd> + <kbd>←</kbd><kbd>→</kbd><kbd>↑</kbd><kbd>↓</kbd>| resize currently focused window (10px)
| <kbd>Alt</kbd> + <kbd>Ctrl</kbd> + <kbd>←</kbd><kbd>→</kbd><kbd>↑</kbd><kbd>↓</kbd>| resize currently focused window (1px)
| <kbd>Alt</kbd> + <kbd>[0-9]</kbd> | switch to workspace [0-9]
| <kbd>Alt</kbd> + <kbd>Shift</kbd> + <kbd>[0-9]</kbd> | move active window to workspace [0-9]
| <kbd>Print</kbd> | take screenshot

Vim Keybindings can be used instead of arrow bindings and are encouraged.

## Credits
- [rose-pine backgrounds](https://github.com/the-argus/wallpapers)
- [gruvbox backgrounds](https://gruvbox-wallpapers.pages.dev)
- [inspiration + backgrounds](https://github.com/prasanthrangan/hyprdots)
- [wallpapers](https://www.wallpaperflare.com)
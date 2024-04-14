<div align="center">
<h1> Material Design Hyprland </h1>
// My Personal Hyprland dotfiles //
</div>

<p align="center">
    Default configuration when installed:
    <img src="https://github.com/POP303U/material/assets/115036828/32a208e7-8e3d-4ad1-86f9-43bf37d6ebbe" alt="Material Bread logo">
</p>

## Installation

The installation script is made for Arch, but **could** work on some Arch based distros with **systemd**.
It only currently works with AMD Cards with experimental Nvidia support.

After a minimal Arch install clone and execute -

```sh
sudo pacman -Syu git
git clone https://github.com/POP303U/material ~/material
cd ~/material/setup-hypr
./install
```

### Updating
To update material you will need to pull the latest changes from github and restore the configs by doing -

```sh
cd ~/material/setup-hypr
git pull
./install
```

## Custom created themes with Thememanager

* Gruvbox-Picom
![image](https://github.com/POP303U/material/assets/115036828/eeeda211-3d9e-48ee-8db9-235ab378b251)

* Material-Design
![image](https://github.com/POP303U/material/assets/115036828/c43f64be-ee28-4872-bbdb-241ac26ae266)

* Frosty-Peaks (Uses Perltone for color generation)
![image](https://github.com/POP303U/material/assets/115036828/be0ac226-d3b6-4d9a-bbe8-3a3916164a62)

## Themes (Currently outdated)
* Catppuccin-Latte
![swappy-20240117_222742](https://github.com/POP303U/hypr-dots/assets/115036828/6ee5f780-da71-4541-8332-0aa64d4eab32)

* Catppuccin-Mocha
![swappy-20240117_222509](https://github.com/POP303U/hypr-dots/assets/115036828/39c2a568-9bcb-420f-b81d-3503a185c536)

* Gruvbox
![swappy-20240117_222055](https://github.com/POP303U/hypr-dots/assets/115036828/90bdbc13-f7f4-40b4-9fee-1abb83ec2b17)

* Rosé-Pine
![swappy-20240117_221654](https://github.com/POP303U/hypr-dots/assets/115036828/7253be10-e0f9-435f-a872-9ec57cfff5f1)

* Rosé-Pine-Moon
![swappy-20240117_221109](https://github.com/POP303U/hypr-dots/assets/115036828/0eb2854b-449e-45a0-934e-574147ba525e)

* Rosé-Pine-Dawn
![swappy-20240117_221156](https://github.com/POP303U/hypr-dots/assets/115036828/2c98e4cf-ec5b-4a3c-8e2a-fd87bff17e27)

* Solarized-Dark
![swappy-20240117_220855](https://github.com/POP303U/hypr-dots/assets/115036828/fa378b48-5f4a-48c3-818c-25a385efa85e)

* Solarized-Light
![swappy-20240117_220749](https://github.com/POP303U/hypr-dots/assets/115036828/c4040e9c-ec06-4710-b159-d6cea409e268)

* Titanium-Mono
![swappy-20240117_220450](https://github.com/POP303U/hypr-dots/assets/115036828/63597ecd-3e62-4de7-8392-85f26b4f792a)


## Keybindings

| Keys | Action |
| :--  | :-- |
| <kbd>Alt</kbd> + <kbd>Enter</kbd>| launch kitty terminal
| <kbd>Alt</kbd> + <kbd>Shift</kbd> + <kbd>W</kbd>| launch firefox
| <kbd>Alt</kbd> + <kbd>Shift</kbd> + <kbd>E</kbd> | launch dolphin
| <kbd>Alt</kbd> + <kbd>Shift</kbd> + <kbd>Q</kbd>| quit active/focused window
| <kbd>Alt</kbd> + <kbd>Shift</kbd> + <kbd>M</kbd>| quit hyprland session
| <kbd>Alt</kbd> + <kbd>Shift</kbd> + <kbd>Space</kbd> | toggle window on focus to float
| <kbd>Ctrl</kbd> + <kbd>Win</kbd> + <kbd>L</kbd> | lock screen (swaylock)
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

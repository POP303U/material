<div align="center"> 
<h1> hypr-dots </h1>
My Personal Hyprland dotfiles

</div>

<p align="center">
    <img src="https://github.com/POP303U/dotfiles/assets/115036828/b632333d-13ce-46e7-b18d-f85e0b56c519" alt="Material Bread logo">
</p>

## Installation

The installation script is made for Arch, but **could** work on some Arch based distros with **systemd**.
It only currently works with AMD Cards with nvidia support in the future.

After a minimal Arch install (with grub and systemd), clone and execute -

```sh
sudo pacman -Syu git
git clone https://github.com/POP303U/hypr-dots ~/hypr-dots
cd ~/hypr-dots/setup-hypr
./install
```

### Updating
To update hypr-dots you will need to pull the latest changes from github and restore the configs by doing -

```sh
cd ~/hypr-dots/setup-hypr
git pull
./install
```

## Credits
- [backgrounds](https://github.com/the-argus/wallpapers)
- [inspiration](https://github.com/prasanthrangan/hyprdots)

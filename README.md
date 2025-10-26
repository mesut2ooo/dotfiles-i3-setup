
Overview

This repository contains my personal dotfiles and small helper scripts used on my Linux desktop running i3 (Alacritty, dunst, mpv settings, ".x" files, "bashrc", etc.). The files are prepared to be used out-of-the-box on a fresh setup or inside a VM. Designed for reproducible, minimal, and customizable local environments.


---

What’s included

- "~/.config/alacritty/alacritty.yml" — Alacritty terminal configuration
- "~/.config/i3/config" — custom i3 config
- "~/.config/dunst/dunstrc" — notification settings
- "~/.config/mpv/mpv.conf" — mpv default options and keybinds
- "~/.bashrc" — shell customizations and aliases
- "scripts/" — small shell scripts for common tasks (auto wallpaper, auto light, aur updater, power management, battery, ...)
- ".x starter files" - workspace layout for hiDPI monitors

---

Goals

- Make a reproducible i3 desktop config you can deploy on any Linux machine.
- Provide nice defaults while keeping everything easily customizable.
- Keep setup fast and repeatable for demos or interviews.

---
Quick start 

1. Clone:
```
git clone https://github.com/mesut2ooo/dotfiles-i3-setup.git
cd dotfiles-i3-setup
```

2. copy and replace the files:
all the directories to /home/<user>/.config
```
cp -r .scripts /home/<user>
cp .x* /home/<user>
cp .X* /home/<user>
cp .b* /home/<user>
```

4. Reload i3:

`i3-msg reload && i3-msg restart`

---

Customization

- Edit "alacritty.yml" to change font, padding, colors.
- Edit "i3/config" to add keybindings and workspace preferences.
- Move scripts to "/usr/local/bin" if you want global accessibility.

---

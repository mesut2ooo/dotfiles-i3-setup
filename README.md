
Overview

This repository contains my personal dotfiles and small helper scripts used on my Linux desktop running i3 (Alacritty, dunst, mpv settings, ".x" files, "bashrc", etc.). The files are prepared to be used out-of-the-box on a fresh setup or inside a VM. Designed for reproducible, minimal, and customizable local environments.

Repo name suggestion: "dotfiles-i3-setup"

---

What’s included

- "~/.config/alacritty/alacritty.yml" — Alacritty terminal configuration
- "~/.config/i3/config" (or ".x" starter files) — basic i3 config and workspace layout
- "~/.config/dunst/dunstrc" — notification settings
- "~/.config/mpv/mpv.conf" — mpv default options and keybinds
- "~/.bashrc" — shell customizations and aliases
- "scripts/" — small shell scripts for common tasks (backup, quick install, restore)
- "install.sh" — a safe helper script to copy files to your home directory (dry-run supported)
- "README.md" — this file

---

Goals

- Make a reproducible i3 desktop config you can deploy on any Linux machine.
- Provide nice defaults while keeping everything easily customizable.
- Keep setup fast and repeatable for demos or interviews.

---

Quick start (safe)

Important: Always inspect the files before running any install script. This repo provides an "install.sh" with a dry-run mode.

1. Clone:

git clone https://github.com/<your-username>/dotfiles-i3-setup.git
cd dotfiles-i3-setup

2. Dry-run to see what would change:

./install.sh --dry-run

3. Install (will prompt before overwriting):

./install.sh

4. Reload i3:

i3-msg reload && i3-msg restart

---

Customization

- Edit "alacritty.yml" to change font, padding, colors.
- Edit "i3/config" to add keybindings and workspace preferences.
- Move scripts to "/usr/local/bin" if you want global accessibility.

---

Safety & notes

- The "install.sh" includes prompts and a backup step that saves overwritten files into "~/dotfiles_backup_TIMESTAMP".
- Tested on Debian/Ubuntu and Arch-based distributions — minor tweaks may be required for other distros.

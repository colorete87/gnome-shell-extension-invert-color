# Invert Window Color — GNOME Shell Extension

Inverts the color of individual windows with a keyboard shortcut. Based on [gnome-shell-extension-invert-color](https://github.com/maiself/gnome-shell-extension-invert-color), ported for GNOME Shell 48.

## How it works

A GLSL fragment shader applied via `Clutter.ShaderEffect` inverts the RGB channels of the target window actor while preserving alpha. The effect is toggled per-window and survives extension reloads.

## Install

```bash
./install.sh          # copies to ~/.local/share/gnome-shell/extensions/
gnome-extensions enable invert-window@colorete87
```

Then log out and back in (Wayland) or press `Alt+F2` → `r` (X11).

## Usage

Press **Super+I** to toggle color inversion on the focused window.

The shortcut can be changed via `dconf`:

```bash
dconf write /org/gnome/shell/extensions/invert-window/invert-window-shortcut "['<Super>i']"
```

## Uninstall

```bash
./install.sh uninstall
```

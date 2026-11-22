# Boxsmarchy

ENERGY 1 / RHYTHM 2 / MOTION 1.

## Direction

The dark version of [mrboxs's website](https://mrboxs.isntboxs.workers.dev/)
sets the desktop palette: near-black canvas, graphite surfaces, white type,
quiet separators, and inverted black-on-white selections. The
[mrboxs brandkit](https://github.com/mrboxs/mrboxs-brandkit) supplies the
unchanged white cube symbol and outlined wordmark. Catppuccin from Omarchy
4.5.0-3 is the starting theme.

## Decisions

- Background `#09090b`: the website's dark background, converted from OKLCH.
- Graphite `#171717`: shared by the website card and brandkit dark surface.
- Foreground `#fafafa` and accent `#e5e5e5`: the website's dark foreground and primary.
- Border `#3a3a3a`: the brandkit separator, reserved for inactive windows.
- Interactive border `#a1a1a1`: keeps controls distinguishable against graphite.
- Selection: inverted monochrome rows make keyboard position clear without adding a brand hue.
- Code selection `#212121`: preserves syntax and comment contrast while selecting text.
- Syntax: One Dark's complete chromatic palette keeps code categories distinguishable.
- Comments `#828997`: One Dark's secondary neutral replaces its darker comment gray for readability.
- Wallpaper: the original cube is the single focal point, surrounded by generous negative space.
- Typography: retain the user's terminal and shell fonts; the supplied wordmark stays outlined.
- Spacing: retain Omarchy's font-scaled spacing so the theme fits existing displays and controls.
- Motion: no wallpaper animation or extra compositor effects; retain the user's system transitions.

## Scope

This is a dark desktop theme. It adds no new controls, changes no keybindings,
and does not change the global font or compositor geometry. Omarchy generates
the terminal and application configs from `colors.toml`. Neovim uses One Dark
with matching monochrome surfaces. Helix and VS Code carry their own syntax
mapping so orange numbers, yellow types, red variables/tags, blue functions,
purple keywords, green strings, and cyan escapes remain distinct.

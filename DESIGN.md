# Boxsmarchy

ENERGY 1 / RHYTHM 2 / MOTION 1.

## Direction

The dark version of [mrboxs's website](https://mrboxs.isntboxs.workers.dev/)
sets the desktop palette: near-black canvas, graphite surfaces, white type,
quiet separators, and inverted black-on-white selections. The
[mrboxs brandkit](https://github.com/mrboxs/mrboxs-brandkit) supplies the
unchanged cube geometry. The user-supplied Omarchy SVG supplies the six
remaining glyphs for the custom wordmark, replacing only its O with that cube.
Catppuccin from Omarchy
4.5.0-3 is the starting theme.

## Decisions

- Background `#09090b`: the website's dark background, converted from OKLCH.
- Graphite `#171717`: shared by the website card and brandkit dark surface.
- Foreground `#fafafa` and accent `#e5e5e5`: the website's dark foreground and primary.
- Border `#3a3a3a`: the brandkit separator, reserved for inactive windows.
- Interactive border `#a1a1a1`: keeps controls distinguishable against graphite.
- Selection: inverted monochrome rows make keyboard position clear without adding a brand hue.
- Code selection `#212121`: preserves syntax and comment contrast while selecting text.
- Editor list focus: use accent-white rows with dark labels and dark search matches so both focused and selected items remain readable.
- Token weight: bold keywords/operators, functions, types, namespaces, and tag names to expose code structure; retain regular variables, strings, numeric values, and italic comments.
- Token engines: supply matching weight rules for TextMate/semantic tokens, Neovim classic/Tree-sitter/LSP, and Helix scopes.
- Syntax: One Dark's complete chromatic palette keeps code categories distinguishable.
- Comments `#828997`: One Dark's secondary neutral replaces its darker comment gray for readability.
- Logo: replace the Omarchy O with the original mrboxs cube, preserving all six MARCHY glyphs and using `#e5e5e5`.
- Logo spacing: a 60-unit gap separates the 211.45-unit cube from M, exceeding the brandkit's quarter-width clear-space rule.
- Wallpaper: the custom wordmark is centered at 1600 px wide on a 3840 × 2160 canvas, matching the supplied reference's composition.
- Default assets: wallpaper, wallpaper preview, unlock logo, and unlock preview all render directly from `logo.svg`.
- Alternate wallpaper: retain the original symbol-only canvas as the second background.
- Framed icon: reconstruct the supplied Omarchy icon on its 20-unit pixel grid, recolor to accent/background, and place the unmodified mrboxs symbol in its center.
- Icon clear space: the centered cube is 120 units high inside the 180-unit opening, leaving at least 30 units around it without nonuniform scaling.
- Fastfetch geometry: render through Kitty with height only, letting terminal pixel metrics determine the width instead of stretching both dimensions.
- Fastfetch alignment: a dedicated 624 × 656 export holds the unchanged square frame with 12 px above and 20 px below; its 27-row display height is calibrated to the default three-panel information block.
- Typography: retain the user's terminal and shell fonts; the user-supplied wordmark stays outlined.
- Spacing: retain Omarchy's font-scaled spacing so the theme fits existing displays and controls.
- Motion: no wallpaper animation or extra compositor effects; retain the user's system transitions.

## Scope

This is a dark desktop theme. It adds no new controls, changes no keybindings,
and does not change the global font or compositor geometry. Omarchy generates
the terminal and application configs from `colors.toml`. Neovim uses One Dark
with matching monochrome surfaces. Helix and VS Code carry their own syntax
mapping so orange numbers, yellow types, red variables/tags, blue functions,
purple keywords, green strings, and cyan escapes remain distinct.

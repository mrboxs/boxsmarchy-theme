# Sources

- Theme base: Catppuccin from the installed Omarchy 4.5.0-3 package,
  `/usr/share/omarchy/themes/catppuccin`. Its palette, editor selection, icons,
  and artwork have been replaced for Boxsmarchy.
- Theme format: [Making your own theme](https://omarchy.org/manual/making-your-own-theme/).
- Desktop direction: [mrboxs website](https://mrboxs.isntboxs.workers.dev/),
  dark CSS tokens inspected on 23 November 2026.
- Logo masters: [mrboxs brandkit](https://github.com/mrboxs/mrboxs-brandkit),
  `01-logos/dark/mrboxs-symbol.svg`, `mrboxs-horizontal.svg`, and
  `mrboxs-symbol-small.svg`. The supplied files in `assets/brand/` are unchanged.
  `assets/icon.svg` is a copy of the full symbol. Logo ownership remains with mrboxs.
- Syntax palette: [Atom One Dark](https://github.com/atom/one-dark-syntax/blob/master/styles/colors.less).
  Standard hex values are red `#e06c75`, orange `#d19a66`, yellow `#e5c07b`,
  green `#98c379`, cyan `#56b6c2`, blue `#61afef`, purple `#c678dd`, and
  syntax text `#abb2bf`. Comments use the brighter secondary neutral `#828997`.
- Neovim syntax engine: [onedark.nvim](https://github.com/navarasu/onedark.nvim).
  The plugin is a LazyVim dependency, not vendored source.
- Unlock preview layout: Omarchy's `omarchy plymouth preview` command and its
  installed default Plymouth assets. The preview is rendered offline; no boot
  configuration or initramfs is changed.

The wallpaper embeds the original symbol geometry on the website's dark canvas.
No Catppuccin backgrounds or logo assets are redistributed.

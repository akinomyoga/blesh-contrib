# :pencil: colorglass

If your terminal supports 24-bit color, you can adjust the theme colors by
specifying gamma, contrast, hue rotation, etc.  This also works for the
terminals without the 24-bit color support if `bleopt term_index_colors` is
properly set up, but the resulting colors would be reduced to a smaller number
of colors.

```bash
ble-import contrib/colorglass

# If your terminal does not support the 24-bit colors, please explicitly
# configure it by putting the following line:
#bleopt term_true_colors=
```

## Options

### Blopet `colorglass_gamma` (Integer)

This option specifies the change of gamma by percentage.  For example, `bleopt
colorglass_gamma=5` performs the gamma correction with $\gamma=1.05$, and
`bleopt colorglass_gamma=-5` performs the gamma correction with $\gamma=0.95$

```bash
# default
bleopt colorglass_gamma=0
```

### Blopet `colorglass_contrast` (Integer)

This option specifies the contrast modification in the range -100..100.

```bash
# default
bleopt colorglass_contrast=0
```

### Blopet `colorglass_rotate` (Integer)

This option specifies the angle of hue rotation in degrees.

```bash
# default
bleopt colorglass_rotate=0
```

### Blopet `colorglass_saturation` (Integer)

This option specifies the change of saturation in the range -100..100.

```bash
# default
bleopt colorglass_saturation=0
```

### Blopet `colorglass_brightness` (Integer)

This option specifies the change of brightness in the range -100..100.

```bash
# default
bleopt colorglass_brightness=0
```

### Blopet `colorglass_alpha` (Integer)

This option specifies the opacity in the range 0..255 when the color is
synthesized with the background color specified by `bleopt colorglass_color`.

```bash
# defualt
bleopt colorglass_alpha=255
```

### Blopet `colorglass_color` (Integer)

This option specifies the background color used by the color synthesis by
`bleopt colorglass_alpha`.

```bash
# defualt
bleopt colorglass_color=0x8888FF
```

### Bleopt `colorglass_base16_palette` (Empty/Enumerate)

This option specifies a color scheme of `base16` colors (index colors 0..15).
When this option is set to a (non-empty) palette name, index colors 0..15 in
the output of `ble.sh` will be replaced by the corresponding 24-bit colors in
the palette.  See [List of base16 palettes](https://akinomyoga.github.io/ble.sh/colorglass.base16.html)
or [`colorglass.base16.dat`](https://github.com/akinomyoga/blesh-contrib/blob/master/colorglass.base16.dat)
for the list of available palettes.

```bash
# defualt
bleopt colorglass_base16_palette=
```

### Bleopt `colorglass_blindness` (Enumerate)

When this option is set to a non-empty value, the colors under color blindness
are simulated.  Five values `none`, `protanopia`, `deuteranopia`, `tritanopia`,
and `achromatopsia` are supported.

```bash
# default
bleopt colorglass_blindness=none
```

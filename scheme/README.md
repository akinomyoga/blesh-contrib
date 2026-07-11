# blesh/contrib/schemes

## Use the "base16" scheme with the terminal's color scheme

The default color scheme tries to use many colors and styles to distinguish
various kinds of elements in the command line, with the care for visibility in
terminals with both light and dark backgrounds.  However, the scheme does not
necessarily match the terminal's color scheme for the basic 16 colors that the
user specifies in the terminal's configuration.

When the user specifies the terminal's color scheme, and when the user wants to
use only the basic 16 colors excluding colors outside the terminal's color
scheme, the user can use the "base16" color scheme:

```bash
# ~/.blerc

bleopt color_scheme=base16
```

## Use the "base16" scheme with a specified base16 palette

The `base16` color scheme can be combined with one of base16 palettes defined
in `contrib/colorglass.base16.dat`.  Currently, [**865
palettes**](https://akinomyoga.github.io/ble.sh/colorglass.base16.html) are
available for `bleopt colorglass_base16_palette`.  For example, to use
`TokyoNight` palette, one can use the following setting:

```bash
# ~/.blerc

ble-import colorglass
bleopt color_scheme=base16
bleopt colorglass_base16_palette=TokyoNight
```

However, this method can only use the basic 16 colors of the named palettes.
If the upstream palette defines more colors, and if the user wants to make use
of those colors in the upstream palette, the user can define a color scheme
defining finer settings of faces.

## Creating a new color scheme

This directory contains the definitions of the color schemes that can be
specified to [`bleopt
color_scheme`](https://github.com/akinomyoga/ble.sh/wiki/Manual-%C2%A72-Graphics#user-content-bleopt-color_scheme).
Each file defines one color scheme.  To define a color scheme named `example`,
one must first creates a file `example.bash` in this directory.  The file
should define a shell function named `ble/contrib/scheme:sample/initialize`,
which contains `ble-face` settings for the color scheme.  To clear the effects
of the previously specified color scheme, one should first call
`ble/contrib/scheme:default/initialize` (which should be imported by `bleopt
contrib/scheme/default`) before setting any faces.  Therefore, the typical
structure of the scheme file becomes the following form:

```bash
# The "sample" color scheme for ble.sh
# Copyright (c) 2026, Your Name <email@address>
#
# This color scheme is based on the following project:
# https://example.com/theme/example.html

ble-import contrib/scheme/default

function ble/contrib/scheme:sample/initialize {
  ble/contrib/scheme:default/initialize
  
  # ...ble-face settings come here...
}
```

To derive a color scheme from an existing color scheme `example_base`, one can
import and call `ble/contrib/scheme:example_base/initialize` instead of
`ble/contrib/scheme:default/initialize`.

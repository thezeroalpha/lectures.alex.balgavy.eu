+++
title = 'Responsive Web Design'
+++
# Responsive Web Design
- variety of devices (handheld have different screen sizes)
- device independence: functional UX via any access mechanism
- responsive web design makes a page look good on all devices
- solutions
    - fluid grids — percent instead of pixels
    - fluid images — max width at 100%
    - media queries (below

## Media queries

CSS used media types (screen, print, etc.) to target a specific class of devices, but most browsers didn't really implement its functionality

in CSS3, the W3C included media queries to inspect physical characteristics of the device being used

either in a `<link>` tag:

```html
<link rel="stylesheet" type="text/css" media="screen and (max-device-width: 480px) and (resolution: 163dpi)" href="stylesheet.css" />
```

or in a `@media` rule inside the actual CSS file:

```css
@media screen and (max-device-width: 480px) {
  .column {
    float: none;
  }
}
```

using this stuff, you can disable floats and set the width/margin for specific screen sizes

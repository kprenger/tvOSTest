# tvOSTest
Simple tvOS app that displays a collection view of cells and mimics the standard AppleTV motion effect

The main purpose is to attempt to recreate the parallax / zooming effect in the native UI of AppleTV. This was made a _bit_ easier with the addition of `overlayContentView` on `UIImageView`, but that still doesn't solve _every_ case. Also, supporting tvOS <11 still requires some customization.

This also includes how to use `overlayContentView` and rendering a `UIView` to an image to be able to use that within a `UIImageView`.

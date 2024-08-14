# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

pkgname=pulseaudio-equalizer-ladspa
pkgver=3.0.2
pkgrel=9
pkgdesc="A 15-band equalizer for PulseAudio"
url="https://github.com/pulseaudio-equalizer-ladspa/equalizer"
license=(GPL-3.0-only)
arch=(any)
depends=(
  bash
  bc
  glib2
  gtk3
  pulseaudio  # Uses pacmd, which is not supported by pipewire-pulse
  python
  python-gobject
  swh-plugins
)
makedepends=(
  git
  meson
)
source=("$pkgname::git+$url#tag=v$pkgver")
b2sums=('e5b817cf942505078c7fa42542b775fb81cfea802927badfe4d41bffb479f777bad11f7434f4a6932f7a51149c02b29f2bd5115968d3a596ae118eb9e8af9b30')

build() {
  arch-meson $pkgname build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}

# vim:set sw=2 sts=-1 et:

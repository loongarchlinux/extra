# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Dan Serban
# Contributor: Federico Chiacchiaretta

pkgname=transmageddon
pkgver=1.5
pkgrel=12
pkgdesc='Simple python application for transcoding video into formats supported by GStreamer'
arch=(any)
url='http://www.linuxrising.org/'
license=(LGPL-2.1-or-later)
depends=(
  bash
  gdk-pixbuf2
  glib2
  gst-plugins-base
  gst-plugins-base-libs
  gst-python
  gstreamer
  gtk3
  hicolor-icon-theme
  libgudev
  libnotify
  python
  python-gobject
)
makedepends=(
  appstream-glib
  autoconf-archive
  git
  intltool
)
optdepends=(
  'gst-libav: Extra media codecs'
  'gst-plugins-bad: Extra media codecs'
  'gst-plugins-good: Extra media codecs'
  'gst-plugins-ugly: Extra media codecs'
)
source=(
  "git+https://gitlab.gnome.org/Archive/transmageddon.git#tag=v$pkgver"
  transmageddon-autotools-fixes.patch
  transmageddon-xml.etree.ElementTree.patch
  transmageddon-gi-versions.patch
  transmageddon-set-prgname.patch
  transmageddon-translatable.patch
)
b2sums=(
  9220de187030e4f24812664bfee851dc3e5dc6f7a9a1d72f9f5eaf06d7c38982ff5ac04feb960d1207485df78bd4724661af4c94fa9374315e1c2bb41608bf47
  53873a074cdf44bca6250feafadd85f746310a64b661af7325e57b456eedffab66cabfc24d401e1ca38df462d703b422c768b5c8bd07a5110735ffe414f6e0e9
  fae826bbc928c500de2b7652d2b314243271a57145e2a5dcd9bf76bc8816e5ac745b8a9572750f30d3cb79240d4c0620814b253095d69f1bb0950d61a7b02c78
  7558881c0d814f96505f69f79354f751d9972879edca8fd6358933d2d53ff9b460de8aa079442aa896bc7ca6ba2fe0eed5ea99dc2b0e9d25872cc653adff5040
  1c85341a4316ea09674ac4d97079f36703ffc336b2881a470644fb69df715eb3f40380698a2eecfb6d23f88486d416cf03c27117661703790755df5af5df7007
  ec2e2474fb07540ddab6c310666a1f44636d47204973f80a735e3e3b1624ad855881c844eb607fe595e6baaf819e2d4f9dec6e6b92a4d4ddc3872c89ed976284
)

prepare() {
  cd $pkgname

  # Fix AppStream metadata
  git cherry-pick -n e95f3de2803b09c6a67608b79a69b4a6f014f089
  git cherry-pick -n fd139c5cf48f1a805b479899c2bc64156e733209

  # Fix build system
  git apply -3 ../transmageddon-autotools-fixes.patch

  # Fix run with Python 3.9
  git apply -3 ../transmageddon-xml.etree.ElementTree.patch

  # Fix run when GTK 4 is installed
  git apply -3 ../transmageddon-gi-versions.patch

  # Set prgname to application ID
  git apply -3 ../transmageddon-set-prgname.patch

  # Mark Cancel button translatable
  git apply -3 ../transmageddon-translatable.patch

  autoreconf -fi
}

build() {
  cd $pkgname
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}

# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: FaziBear <fazibear@gmail.com>

pkgname=jruby
pkgver=9.4.3.0
pkgrel=1
pkgdesc="100% pure-Java implementation of the Ruby programming language"
url="https://www.jruby.org/"
arch=(any)
license=(EPL GPL2 LGPL2.1 custom)
options=(!strip)
source=(https://repo1.maven.org/maven2/org/jruby/jruby-dist/$pkgver/jruby-dist-$pkgver-bin.tar.gz)
md5sums=('526006fefb3e5ffc5095ab5599cc38c6')
sha1sums=('41c683cb5c493c7bda937527611a23a8e60677f0')
sha256sums=('b097e08c5669e8a188288e113911d12b4ad2bd67a2c209d6dfa8445d63a4d8c9')

prepare() {
  cd jruby-$pkgver
  rm -rv bin/*.{bat,dll,exe} lib/jni/{Darwin,*-SunOS,*-Windows,*-AIX,*-*BSD}
  chmod -cR g-w .
}

package() {
  depends=(java-runtime-headless bash)

  mkdir -p "$pkgdir"/{opt,usr/bin,usr/share/licenses/$pkgname}
  cp -a jruby-$pkgver "$pkgdir/opt/jruby"
  ln -srt "$pkgdir/usr/bin" \
    "$pkgdir"/opt/jruby/bin/j{irb,irb_swing,gem,ruby,rubyc}
  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 jruby-$pkgver/COPYING
}

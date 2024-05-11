# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: FaziBear <fazibear@gmail.com>

pkgname=jruby
pkgver=9.4.7.0
pkgrel=1
pkgdesc="100% pure-Java implementation of the Ruby programming language"
url="https://www.jruby.org/"
arch=(any)
license=(
  '(EPL-2.0 OR GPL-2.0-only OR LGPL-2.1-only) AND BSD-3-Clause AND MIT AND MIT-0 AND Apache-2.0 AND Ruby'
)
depends=(
  bash
  gcc-libs
  glibc
  java-runtime-headless
)
options=(
  !debug
  !strip
)
source=(
  "https://repo1.maven.org/maven2/org/jruby/jruby-dist/$pkgver/jruby-dist-$pkgver-bin.tar.gz"{,.asc}
)
b2sums=('8459baaf4769cb4977f3865f0833ce051be303f56dccfd5f6e14dcd765388b8c8bc7ceb632b0fbcd4187a2a6924e07be9e27fd416b0a7004ed567b03641c4587'
        'SKIP')
validpgpkeys=(
  416952B945B78A34C6C7678562EBFC78FE4156D1  # Thomas E. Enebo <tom.enebo@gmail.com>
)

# https://www.jruby.org/download
md5sums=('a0633ca837efff62edca84ceae1f5515'
         'SKIP')
sha1sums=('ea3b99edcb48ed436173977551a113759541c18c'
          'SKIP')
sha256sums=('f1c39f8257505300a528ff83fe4721fbe61a855abb25e3d27d52d43ac97a4d80'
            'SKIP')

prepare() {
  cd jruby-$pkgver
  rm -rv bin/*.{bat,dll,exe} lib/jni/{Darwin,*-SunOS,*-Windows,*-AIX,*-*BSD}
  chmod -cR g-w .
}

package() {
  mkdir -p "$pkgdir"/{opt,usr/bin,usr/share/licenses/$pkgname}
  cp -a jruby-$pkgver "$pkgdir/opt/jruby"
  ln -srt "$pkgdir/usr/bin" \
    "$pkgdir"/opt/jruby/bin/j{irb,irb_swing,gem,ruby,rubyc}
  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 jruby-$pkgver/COPYING
}

# vim:set sw=2 sts=-1 et:

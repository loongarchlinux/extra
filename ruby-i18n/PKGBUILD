# Maintainer: David Runge <dvzrv@archlinux.org>

_name=i18n
pkgname=ruby-i18n
pkgver=1.14.1
pkgrel=3
pkgdesc="New wave internationalisation support for Ruby"
arch=(any)
url="https://github.com/ruby-i18n/i18n"
license=(MIT)
depends=(
  ruby
  ruby-concurrent
)
makedepends=(ruby-rdoc)
checkdepends=(
  ruby-activesupport
  ruby-bundler
  ruby-minitest
  ruby-mocha
  ruby-racc
  ruby-rake
  ruby-test_declarative
)
options=(!emptydirs)
source=(
  $pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz
  $pkgname-1.14.1-update_mocha.patch::https://github.com/ruby-i18n/i18n/commit/79c85289d06d69171b7f118c7f469c7282b24351.patch
)
sha512sums=('89a293c00c7e62e802823d8011142a0786268b4c8341a9e389182988f1372655b4c5410ee10d6632af2fee645fbbf2feda2ccc4669d59d44640d3fa2c34b9e86'
            '6a692556eb0eded65cc4f6872da13ceb9013c8a9b9a9e0159415b5f99dc9e6245f6537387b5b8d342440d14effd7a3849410635eba372e882110ac6d99745f4c')
b2sums=('b01b5fefd5033352455110e4fda3d567a5033c6bb732dd11519a3859a3cc4d57bd4229ea3346f2e680575f6ac4d7038d4bcbfd0ea314d2e8b08f26858ffd22f6'
        '9ed09eb5ac449c90f7d290bcc0d259fd795fedba4278bc8abed3e42653b03c1573eb1e2ecabff41703bda452f55d4af4977239cafa6ec3a8eb4be767e48a732a')

prepare() {
  # update mocha requirement
  patch -Np1 -d $_name-$pkgver -i ../$pkgname-1.14.1-update_mocha.patch

  cd $_name-$pkgver

  # update gemspec/Gemfile to allow newer version of the dependencies
  sed -i -e 's|~>|>=|g' $_name.gemspec Gemfile
}

build() {
  local gemdir="$(gem env gemdir)"
  local gem_install_options=(
    --local
    --verbose
    --ignore-dependencies
    --no-user-install
    --install-dir tmp_install/$gemdir
    --bindir tmp_install/usr/bin
    $_name-$pkgver.gem
  )
  local unrepro_files=(
    tmp_install/$gemdir/cache/
    tmp_install/$gemdir/gems/$_name-$pkgver/vendor/
    tmp_install/$gemdir/doc/$_name-$pkgver/ri/ext/
  )

  cd $_name-$pkgver

  gem build $_name.gemspec
  gem install "${gem_install_options[@]}"

  # remove unrepreducible files
  rm -frv "${unrepro_files[@]}"

  find tmp_install/$gemdir/gems/ \
    -type f \
    \( \
      -iname "*.o" -o \
      -iname "*.c" -o \
      -iname "*.so" -o \
      -iname "*.time" -o \
      -iname "gem.build_complete" -o \
      -iname "Makefile" \
    \) \
    -delete

  find tmp_install/$gemdir/extensions/ \
    -type f \
    \( \
      -iname "mkmf.log" -o \
      -iname "gem_make.out" \
    \) \
    -delete
}

check() {
  local gemdir="$(gem env gemdir)"

  cd $_name-$pkgver

  GEM_HOME="tmp_install/$gemdir" rake test
}

package() {
  cd $_name-$pkgver

  mv -v tmp_install/* "$pkgdir/"

  install -vDm 0644 MIT-LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 0644 {CHANGELOG,README}.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

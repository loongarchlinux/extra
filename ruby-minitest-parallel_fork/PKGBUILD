# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=ruby-minitest-parallel_fork
pkgver=2.0.0
pkgrel=2
pkgdesc='Fork-based parallelization for minitest'
arch=(any)
url='https://github.com/jeremyevans/minitest-parallel_fork'
license=(MIT)
depends=(
  ruby
  ruby-minitest
)
makedepends=(
  ruby-minitest-global_expectations
  ruby-minitest-hooks
)
checkdepends=(
  ruby-rake
  ruby-rspec
)
options=(!emptydirs)
source=(https://github.com/jeremyevans/minitest-parallel_fork/archive/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('f4987c2ec664b6c407516ef2905ccb1daae054b21da0f0e6572ce308e33b0411')

build() {
  local _gemdir="$(gem env gemdir)"
  cd minitest-parallel_fork-$pkgver
  gem build minitest-parallel_fork.gemspec
  gem install \
    --local \
    --verbose \
    --ignore-dependencies \
    --no-user-install \
    --install-dir "tmp_install/$_gemdir" \
    --bindir "tmp_install/usr/bin" \
    minitest-parallel_fork-$pkgver.gem
  find "tmp_install/$_gemdir/gems/" \
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
  rm -r tmp_install/$_gemdir/cache
}

check() {
  local _gemdir="$(gem env gemdir)"
  cd minitest-parallel_fork-$pkgver
  GEM_HOME="tmp_install/$_gemdir" rake
}

package() {
  cd minitest-parallel_fork-$pkgver
  cp -a tmp_install/* "$pkgdir"/
  install -Dm644 MIT-LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}

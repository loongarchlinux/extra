# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=towncrier
pkgver=23.11.0
pkgrel=1
pkgdesc="Utility to produce useful, summarised news files for your project"
arch=('any')
url="https://github.com/twisted/towncrier"
license=('MIT')
depends=(
  'python'
  'python-click'
  'python-incremental'
  'python-jinja'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-hatchling'
)
checkdepends=(
  'git'
  'python-twisted'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('6226ef75c163748872f0f5d60c03629365cf0a942412ca791ea28762a227942d974f8573205551678735380629eadf2bf726478b0ef1d4d1e6ee14b47e25fbae')

prepare() {
  # we do not support byzantine pinning of build dependencies
  sed -e 's/~=/>=/g; s/==/>=/g' -i $pkgname-$pkgver/pyproject.toml
}

build() {
  cd towncrier-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd towncrier-$pkgver
  python -m installer --destdir=tmp_install dist/*.whl
  local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
  PYTHONPATH="$PWD/tmp_install/usr/lib/python${python_version}/site-packages" PATH="$PWD/tmp_install/usr/bin:$PATH" trial towncrier
}

package() {
  cd towncrier-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}

# vim:set ts=2 sw=2 et:

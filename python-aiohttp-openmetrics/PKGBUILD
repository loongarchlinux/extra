# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=python-aiohttp-openmetrics
_name=${pkgname#python-}
pkgver=0.0.12
pkgrel=1
pkgdesc='OpenMetrics provider for aiohttp'
arch=('any')
url=https://github.com/jelmer/aiohttp-openmetrics
license=('Apache')
depends=('python-aiohttp' 'python-prometheus_client')
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
source=("git+$url.git#tag=v$pkgver?signed")
b2sums=('SKIP')
validpgpkeys=('DC837EE14A7E37347E87061700806F2BD729A457') # Jelmer Vernooĳ <jelmer@jelmer.uk>

build() {
  cd "$_name"
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd "$_name"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=python-aiohttp-openmetrics
_name=${pkgname#python-}
pkgver=0.0.12
pkgrel=2
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
b2sums=('a561f8f92cd22d3ff68aa7f3d219cbba46e92ac98200fbfe8829304b6fd48917f0f8ad4cf34527b1490aa691c8640c946c457566a2b3cac19efeb125746e10b1')
validpgpkeys=('DC837EE14A7E37347E87061700806F2BD729A457') # Jelmer Vernooĳ <jelmer@jelmer.uk>

build() {
  cd "$_name"
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd "$_name"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

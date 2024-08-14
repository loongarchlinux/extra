# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

_pkgname=dkimpy
pkgname=python-dkim
pkgver=1.1.8
pkgrel=1
pkgdesc='Python library that implements DKIM and ARC email signing and verification'
arch=(any)
url=https://launchpad.net/dkimpy
license=(ZLIB)
depends=(python-dnspython)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-authres
  python-pynacl
)
optdepends=(
  'python-aiodns: for asycnio'
  'python-authres: for ARC'
  'python-pynacl: for use of ed25519 capability'
)
source=("git+https://git.launchpad.net/$_pkgname#tag=$pkgver")
b2sums=('835ac562dfcf6936f9c344206fb2e8faa05fe390526ae3a52e13fce88947d96b4cc1cc52434a1aac4c823a3c6f2c809104f4432e476a6642ba630706dfe4d168')

build() {
  cd $_pkgname
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd $_pkgname
  python -m unittest dkim.tests.test_suite
}

package() {
  cd $_pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s "$site_packages"/$_pkgname-$pkgver.dist-info/LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

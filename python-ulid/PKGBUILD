# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=python-ulid
pkgver=2.5.0
pkgrel=1
pkgdesc="ULID implementation for Python"
arch=(any)
url="https://github.com/mdomke/python-ulid"
license=(MIT)
depends=(python)
makedepends=(
  python-build
  python-hatch-fancy-pypi-readme
  python-hatch-vcs
  python-hatchling
  python-installer
  python-wheel
)
checkdepends=(
  python-freezegun
  python-pydantic
  python-pytest
)
optdepends=('python-pydantic: for pydantic integration')
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz)
sha512sums=('9101c43e0ea95278a7d6af01d5a5cf5784a7ac697e633a7c56bd75fce3b214f1fc24ab2e9e70e2779abebd3c2a21e3167a4c70d385205fbd67eb3e1d213e5a41')
b2sums=('d009934f2e66419f42066e2c8a8fdb4ca8229a31a57968013a2c70324a371a14a7f6df5385bf77c877eb31f0888cc89af484c887c1303ae31f30b268e25af422')

build() {
  cd $pkgname-$pkgver
  SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
  )
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $pkgname-$pkgver
  # install to temporary location, as importlib is used
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="$PWD/test_dir/$site_packages:$PYTHONPATH"
  pytest "${pytest_options[@]}"
}

package() {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 {CHANGELOG,README}.rst -t "$pkgdir/usr/share/doc/$pkgname/"
}

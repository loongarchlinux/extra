# Maintainer: David Runge <dvzrv@archlinux.org>

_name=unearth
pkgname=python-unearth
pkgver=0.10.0
pkgrel=1
pkgdesc="A utility to fetch and download python packages"
arch=(any)
url="https://github.com/frostming/unearth"
license=(MIT)
depends=(
  python
  python-packaging
  python-requests
  python-urllib3
)
makedepends=(
  python-build
  python-installer
  python-pdm-backend
  python-wheel
)
checkdepends=(
  python-flask
  python-pytest
  python-pytest-httpserver
  python-requests-wsgi-adapter
  python-trustme
)
optdepends=('python-keyring: use keyring for authentication')
source=(
  https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz
)
sha256sums=('d5b152a5ab2aa3e5149a11cf7b3ba5c5d493176dca38f66ca8969dadd5a8f645')
b2sums=('8b18df4616fc72025492aa187101bc1f338967b1738ef9ec33d16cbd906c1cf91c1b84e391538521b4a9d6ea40301eb0b7ed0926aa4e6c4d6ffc57401f9d78d9')

build() {
  cd $_name-$pkgver
  export PDM_PEP517_SCM_VERSION=$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_name-$pkgver
  # install to temporary location, as importlib is used
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="test_dir/$_site_packages:$PYTHONPATH"
  pytest -vv
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

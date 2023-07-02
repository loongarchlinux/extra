# Maintainer: David Runge <dvzrv@archlinux.org>

_name=flufl_i18n
pkgname=python-flufl.i18n
pkgver=5.0.1
pkgrel=1
pkgdesc="A high level API for internationalization"
arch=(any)
url="https://gitlab.com/warsaw/flufl.i18n"
license=(Apache)
depends=(
  python
  python-atpublic
)
makedepends=(
  python-build
  python-installer
  python-pdm-backend
)
checkdepends=(
  python-sybil
  python-pytest
)
provides=(python-flufl-i18n)
replaces=(python-flufl-i18n)
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha512sums=('94c6e8a948b0093bbd026732b65e11fcf1fa4ff9af75f5f39685e7dc2b709584ced10c38d9a3f2568ff649dfef943362e62c8d52dbafd709876a9e3d97ef4351')
b2sums=('d0a8f830e1939403be0afe01185d9f6804d48663e9ae2719ad9faf844cefbda0cbd24d42c17578bc50f3c4cb336558e7da143ac22f7c0f987dac86fce706b66d')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_name-$pkgver
  # install to temporary location, as importlib is used
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="test_dir/$_site_packages:$PYTHONPATH"
  pytest -vv -c /dev/null
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
}

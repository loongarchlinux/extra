# Maintainer: David Runge <dvzrv@archlinux.org>

_name=mailmanclient
pkgname=python-mailmanclient
pkgver=3.3.5
pkgrel=5
pkgdesc="Official Python bindings for the GNU Mailman 3 REST API"
arch=(any)
url="https://gitlab.com/mailman/mailmanclient"
license=(LGPL-3.0-or-later)
depends=(
  python
  python-requests
)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  mailman3
  python-falcon
  python-httpx
  python-pytest
  python-pytest-asyncio
  python-pytest-services
)
source=(git+$url?signed#tag=$pkgver)
sha512sums=('7e3b007daf63a75c07d192b985050415cdf5fced5313c8acf7862e7758e0e947661a11fcb66461f4fafc801a6e4fca8dca17f5da333b9a99eb5a2fd4a7abcadf')
b2sums=('42079a43a4d96fbb6406f5d94b1894caaa8a763db7af1a054a2bd2c3212f02a6887bae2f638755b3863b3f5bf20869bf99789fb200db79adf6c0b0d91b332e02')
validpgpkeys=('541EA0448453394FF77A0ECC9D9B2BA061D0A67C') # Abhilash Raj <raj.abhilash1@gmail.com>

build() {
  cd $_name
  python -m build --wheel --no-isolation
}

check() {
  cd $_name
  pytest -v -k 'not using.rst and not test_find_user_page and not test_find_users'
}

package() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_name
  python -m installer --destdir="$pkgdir" dist/*.whl
  # remove tests
  rm -frv "$pkgdir/$site_packages/$_name/tests/"
  find "$pkgdir/$site_packages/" -type f -iname "*conftest.py" -delete
  install -vDm 644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
}

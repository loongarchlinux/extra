# Maintainer: David Runge <dvzrv@archlinux.org>

_name=mailmanclient
pkgname=python-mailmanclient
_commit=c682abb02708fdc2a1ddd5a4440e5ab2ccd02b2b  # refs/tags/3.3.5
pkgver=3.3.5
pkgrel=3
pkgdesc="Official Python bindings for the GNU Mailman 3 REST API"
arch=(any)
url="https://gitlab.com/mailman/mailmanclient"
license=(LGPL3)
depends=(
  python
  python-requests
  python-typing-extensions
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
source=(git+$url#tag=$_commit?signed)
sha512sums=('SKIP')
b2sums=('SKIP')
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

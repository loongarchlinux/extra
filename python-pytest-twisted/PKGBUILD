# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-pytest-twisted
pkgver=1.14.1
pkgrel=2
pkgdesc='A twisted plugin for py.test'
arch=('any')
license=('BSD')
url='https://github.com/pytest-dev/pytest-twisted'
depends=('python-pytest' 'python-greenlet' 'python-decorator' 'python-twisted')
makedepends=('python-setuptools')
source=("https://github.com/pytest-dev/pytest-twisted/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('d5b6d629ed3cf7ae1537e76494fa7eb4bbb9767cbc50d97a5657c668b381f39236acc6224b3754d62e2cccd4dff7e6161265ddc6a939f0488cef53eeade0eae9')

build() {
  cd pytest-twisted-$pkgver
  python setup.py build
}

check() {
  # Hack entry points by installing it

  cd pytest-twisted-$pkgver
  python setup.py install --root="$PWD/tmp_install" --optimize=1
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  PYTHONPATH="$PWD/tmp_install/${site_packages}:$PYTHONPATH" py.test
}

package() {
  cd pytest-twisted-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}

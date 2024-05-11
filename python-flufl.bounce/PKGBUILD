# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=python-flufl.bounce
_name="${pkgname#python-}"
pkgver=4.0
pkgrel=5
pkgdesc="Email bounce detectors"
arch=(any)
url="https://gitlab.com/warsaw/flufl.bounce"
license=(Apache-2.0)
depends=(
  python
  python-atpublic
  python-zope-interface
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(python-pytest)
provides=(python-flufl-bounce)
replaces=(python-flufl-bounce)
source=($url/-/archive/$pkgver/$_name-$pkgver.tar.gz)
sha512sums=('573356a6a450e59e22c2db581e04e4be41600dfa6097d8b353d1ace175ffe5506f032c8be8ef6f3b0e60fb479ae7824d096278c2852df1a06c4c73a269b1c342')
b2sums=('a6faa174ef5ce97338577601aea3781b2860c41983d6eb8d866896eff6d6d9b80603c95fad9116dab4cb38dec643c15befe2c227c946238b1bc47f0ada8540e3')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    # # failing tests with Python 3.12: https://gitlab.com/warsaw/flufl.bounce/-/issues/14
    --deselect flufl/bounce/tests/test_detectors.py::TestOtherBounces::test_SMTP32_failure
    --deselect flufl/bounce/tests/test_detectors.py::TestOtherBounces::test_caiwireless
    --deselect flufl/bounce/tests/test_detectors.py::TestOtherBounces::test_microsoft
  )

  cd $_name-$pkgver
  export PYTHONPATH="build:$PYTHONPATH"
  pytest "${pytest_options[@]}"
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
}

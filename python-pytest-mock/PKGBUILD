# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-pytest-mock
pkgver=3.11.0
_commit=5668efe23e01673af9905febeefd9a9791b023f4
pkgrel=1
pkgdesc="Thin-wrapper around the mock package for easier use with py.test"
arch=('any')
license=('LGPL3')
url="https://github.com/pytest-dev/pytest-mock/"
depends=('python-pytest')
makedepends=('git' 'python-setuptools-scm')
checkdepends=('python-pytest-asyncio')
source=("git+https://github.com/pytest-dev/pytest-mock.git#commit=$_commit")
sha512sums=('SKIP')

build() {
  cd pytest-mock
  python setup.py build
}

check() {
  cd pytest-mock
  python setup.py egg_info
  export PYTHONPATH="src:${PYTHONPATH}"
  # disable all tests that require the plugin to be installed
  pytest -v --assert=plain \
    -k "not test_used_with_session_scope \
        and not test_used_with_package_scope \
        and not test_used_with_module_scope \
        and not test_used_with_class_scope \
        and not test_monkeypatch_ini \
        and not test_monkeypatch_native \
        and not test_standalone_mock \
        and not test_plain_stopall"
}

package() {
  cd pytest-mock
  python setup.py install --root="$pkgdir" --optimize=1
}

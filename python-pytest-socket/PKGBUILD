# Maintainer:
# Contributor: Felix Yan <felixonmars@archlinux.org>

_name=pytest-socket
pkgname=python-pytest-socket
pkgver=0.6.0
pkgrel=4
pkgdesc='Pytest Plugin to disable socket calls during tests'
arch=(any)
license=(MIT)
url="https://github.com/miketheman/pytest-socket"
depends=(
  python
  python-pytest
)
makedepends=(
  python-build
  python-installer
  python-poetry-core
  python-wheel
)
checkdepends=(
  python-asynctest
  python-httpx
  python-pytest-cov
  python-pytest-flake8
  python-pytest-httpbin
  python-requests
  python-starlette
)
source=($url/archive/$pkgver/$pkgname-$pkgver.tar.gz only-emit-license-readme-for-sdist.patch)
sha512sums=('b70ab9fe3c41a707f16b6ae23d45e07238d03a731b3f99b794a6707303cd0301b75360ea164b7de48e9f2d56b5544e2da39373ba14a3b0fc20ef03afce03ab03'
            'cb9b2188672035d1f396ee1672359c91e1978789b8622910616c7b37743d0d6520c9847911e9a18b947b3ab47ffe567a2314c108043dee85fa26e2bd171b7468')
b2sums=('640ce9d047ee422221ac4b707aa8a36b1c9dbeb4e8f9dc138270cbe9e5e04ece849b7308e092c1a6fc67c0c92a48f99aea41db535ad45d87ee87d18e0b6c9607'
        '78561d073c405bfd14489f534dd52a4605678b3b2a21093871241b96152c3af6022a1e61173f2cf4ab7b8b544ed56b77df4680272e8ba5ba91c81dda7de3710b')

prepare() {
  cd $_name-$pkgver
  patch -Np1 -i ${srcdir}/only-emit-license-readme-for-sdist.patch
}

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    # https://github.com/miketheman/pytest-socket/issues/161
    --deselect tests/test_async.py::test_asynctest
  )
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_name-$pkgver
  # install to temporary location, as importlib is used
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="test_dir/$site_packages:$PYTHONPATH"
  pytest "${pytest_options[@]}"
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}

# vim:set ts=2 sw=2 et:

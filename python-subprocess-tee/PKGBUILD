# Maintainer: David Runge <dvzrv@archlinux.org>

_name=subprocess-tee
pkgname=python-subprocess-tee
pkgver=0.4.1
pkgrel=4
pkgdesc="A subprocess.run that works like tee"
arch=(any)
url="https://github.com/pycontribs/subprocess-tee"
license=(MIT)
depends=(python)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-setuptools-scm
  python-wheel
)
checkdepends=(
  ansible-core
  python-enrich
  python-pytest
  python-pytest-xdist
)
optdepends=('python-enrich: for rich text rendering')
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('e8ae073d9f9e0198e55bbdd4cc12babfc7cc2bb13f13bbd07a107452efdf78cbf1a544739381d4e98e55d6a4d1e4de3405b6258fcaa4fcfb871485085a2e8a5b')
b2sums=('06278caf928da5ddc90803cfe5bcffb3e9d1e3c93653de34c2ceca523d9d1e04e33ad53cf2c173e0120d134308b56c52d957ee6611a7808b1aa3e46acefee6a1')

build() {
  cd $_name-$pkgver
  SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --ignore test/test_func.py
  )

  cd $_name-$pkgver
  export PYTHONPATH="src:$PYTHONPATH"
  pytest "${pytest_options[@]}"
}

package() {
  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  # remove tests: https://github.com/pycontribs/subprocess-tee/issues/61
  rm -frv "$pkgdir/$_site_packages/subprocess_tee/test/"
}

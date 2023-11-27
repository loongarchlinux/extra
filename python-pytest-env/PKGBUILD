# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: Rafael Fontenelle <rafaelff@gnome.org>

pkgname=python-pytest-env
# https://github.com/pytest-dev/pytest-env/releases
pkgver=1.1.1
pkgrel=2
pkgdesc='pytest plugin to set environment variables in pytest.ini or pyproject.toml file'
arch=(any)
url='https://github.com/pytest-dev/pytest-env'
license=(MIT)
depends=(python python-pytest)
makedepends=(python-build python-installer python-hatchling python-hatch-vcs)
source=($pkgname-$pkgver.tar.gz::https://github.com/pytest-dev/pytest-env/archive/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('2710adbd8409e1609d1bb610a3e28fb6a8992004c2c54dacbc228f1dcb1cc6f5')

export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver

build() {
  cd pytest-env-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd pytest-env-$pkgver
  # Install to a temporary root as the test suite requires the entry point for
  # its pytest plugin
  pyver=$(python -c "import sys; print('{}.{}'.format(*sys.version_info[:2]))")
  python -m installer --destdir="$PWD/tmp_install" dist/*.whl
  PYTHONPATH="$PWD/tmp_install/usr/lib/python$pyver/site-packages" pytest tests
}

package() {
  cd pytest-env-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}

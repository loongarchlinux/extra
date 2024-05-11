# Maintainer: Bruno Pagani <archange@archlinux.org>

_pkg=mss
pkgname=python-${_pkg}
pkgver=9.0.1
pkgrel=2
pkgdesc="Ultra fast cross-platform multiple screenshots module"
arch=(any)
url="https://github.com/BoboTiG/python-mss"
license=(MIT)
depends=(python)
makedepends=(python-build python-installer python-setuptools)
checkdepends=(python-pytest xorg-server-xvfb libxrandr lsof python-flaky python-wheel python-pytest-cov python-pytest-rerunfailures)
source=(https://files.pythonhosted.org/packages/source/${_pkg::1}/${_pkg}/${_pkg}-${pkgver}.tar.gz)
#source=(${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('6eb7b9008cf27428811fa33aeb35f3334db81e3f7cc2dd49ec7c6e5a94b39f12')

build() {
  cd ${_pkg}-${pkgver}
  python -m build --wheel --no-isolation
}

check() {
  cd ${_pkg}-${pkgver}
  PYTHONPATH="${PWD}/build/lib/" xvfb-run -a -s "+extension RANDR +render -screen 0 1024x768x24" \
    pytest -k 'not test_wheel_python_3_only and not test_resource_leaks'
}

package() {
  cd ${_pkg}-${pkgver}
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE.txt -t "${pkgdir}"/usr/share/licenses/${pkgname}
}

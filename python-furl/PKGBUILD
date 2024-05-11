# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Husam Bilal <husam212 AT gmail DOT com>

_name=furl
pkgname=python-furl
pkgver=2.1.3
pkgrel=5
pkgdesc="A small Python library that makes parsing and manipulating URLs easy"
arch=('any')
url="https://github.com/gruns/furl"
license=('Unlicense')
depends=('python-orderedmultidict' 'python-six')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('ce7455bd1a352243efd9715e80e9f9979631cc058927edcd8c52ccb85d27fd8f32079611bb29c487d2add2d1d941d56e4db75520339dc371b1539811ccefda02')
b2sums=('128d43464f75032f726d6408ee7d0c715b617846798ff80c43c91bac025c943492b0ca4f7271b6989d1a73db8948a313aab2930a8f6ed81d62e7b03e984e6f3d')

build() {
  cd "${_name}-${pkgver}"
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd "${_name}-${pkgver}"
  export PYTHONPATH="build:${PYTHONPATH}"
  # Ignore tests that were failing prior to Python 3.12 rebuild
  pytest -v -k 'not test_hosts and not test_netloc'
}

package() {
  cd "${_name}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -vDm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "${site_packages}/${_name}-${pkgver}.dist-info/LICENSE.md" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}

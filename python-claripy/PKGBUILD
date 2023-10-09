# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

_pyname=claripy
pkgname=python-${_pyname}
pkgver=9.2.69
pkgrel=1
pkgdesc='Abstraction layer for constraint solvers'
url='https://github.com/angr/claripy'
license=('custom:BSD2')
arch=('any')
depends=(
  'python'
  'python-cachetools'
  'python-decorator'
  'python-pysmt'
  'python-z3-solver'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=('python-pytest')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('67ffb1ecd6390f293537cab5b2084d27d611a27d5bb8d704e61ddebed66a0fc6b85b4c5c6fdf9f59bbeebe142c63d8d34c2ab49e1b2f10a3ef6783a82fb1b592')
b2sums=('802248ae96838d19c84f20e29df8da49928f7060a619d06f16c5f2d1b1e647fe25f7baf3b37c43d03218305c2bd3319aae865ace165199502409cefe2a5f1bbe')

prepare() {
  # we don't support version pinning
  sed -e 's/==/>=/' -i $_pyname-$pkgver/setup.cfg
}

build() {
  cd ${_pyname}-${pkgver}
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    # disable broken tests: https://github.com/angr/claripy/issues/348
    --deselect tests/test_solver.py::StandardTests::test_simplification_annotations
    --deselect tests/test_solver.py::TestSolver::test_solver_with_reuse
    --deselect tests/test_solver.py::TestSolver::test_solver_without_reuse
    --deselect tests/test_solver.py::TestSolverReplacement::test_solver_with_reuse
    --deselect tests/test_solver.py::TestSolverReplacement::test_solver_without_reuse
    --deselect tests/test_solver.py::TestHybrid::test_solver_with_reuse
    --deselect tests/test_solver.py::TestHybrid::test_solver_without_reuse
    --deselect tests/test_solver.py::TestComposite::test_solver_with_reuse
    --deselect tests/test_solver.py::TestComposite::test_solver_without_reuse
    --deselect tests/test_solver.py::TestSolverCacheless::test_solver_with_reuse
    --deselect tests/test_solver.py::TestSolverCacheless::test_solver_without_reuse
  )

  cd ${_pyname}-${pkgver}
  PYTHONPATH=build/lib pytest "${pytest_options[@]}"
}

package() {
  cd ${_pyname}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:

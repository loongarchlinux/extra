# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

_pyname=claripy
pkgname=python-${_pyname}
pkgver=9.2.101
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
sha512sums=('2750dce8d24a20b71c43f5230077814c3cf2516504abfd6a9a0e76c10656b9f61ef77ac45bed43b5685890eef31f884ef323af8f3e3bb982261da982312bb7f6')
b2sums=('ab8792c63fba9baca3e53fa45af3d2c128181f688b90783c3413eeeea3455718d8ba491c53ab6aa11bdb3eae2d2458358941ad3ce1be5050d455cddce7e353ce')

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

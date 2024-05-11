# Maintainer: Bruno Pagani <archange@archlinux.org>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>
# Contributor: Oliver Sherouse <oliver DOT sherouse AT gmail DOT com>

pkgname=python-seaborn
pkgver=0.13.2
pkgrel=1
pkgdesc="Statistical data visualization"
arch=(any)
url="https://seaborn.pydata.org/"
license=(BSD)
depends=(python-pandas python-matplotlib)
makedepends=(python-build python-installer python-flit-core)
optdepends=('python-scipy: clustering matrices and some advanced options'
            'python-statsmodels: advanced regression plots')
checkdepends=(python-pytest python-scipy python-statsmodels)
source=(https://github.com/mwaskom/seaborn/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('16de5648993d8e74f9a0f000e5646c10b0c90c037d2625c55ae2c6955a5e6333')

build() {
  cd seaborn-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd seaborn-$pkgver
  PYTHONWARNINGS="ignore" \
  pytest -vv --color=yes \
    --deselect tests/test_relational.py::TestScatterPlotter::test_unfilled_marker_edgecolor_warning \
    --deselect tests/test_distributions.py::TestHistPlotUnivariate::test_kde_singular_data # broken by numpy deprecation warnings
}

package() {
  cd seaborn-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.md -t "$pkgdir"/usr/share/licenses/$pkgname/
}

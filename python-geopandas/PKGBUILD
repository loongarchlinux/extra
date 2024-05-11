# Maintainer: Bruno Pagani <archange@archlinux.org>

_pkg=geopandas
pkgname=python-${_pkg}
pkgver=0.14.3
pkgrel=5
pkgdesc="Python tools for geographic data"
arch=(any)
url="https://geopandas.org"
license=(BSD-3-Clause)
depends=(
    gdal
    python-fiona
    python-numpy
    python-packaging
    python-pandas
    python-pyproj
    python-shapely
)
optdepends=(
    'python-pyogrio: vectorized IO for GDAL/OGR'
    'python-rtree: spatial access methods'
    'python-psycopg2: PostGIS access'
    'python-sqlalchemy: other geodatabase access'
    'python-geopy: geocoding'
    'python-matplotlib: plotting'
#    'python-mapclassify: plotting'
)
makedepends=(
    python-build
    python-installer
    python-setuptools
    python-wheel
)
checkdepends=(
    python-pytest
    python-fsspec
    python-pyogrio
    python-rtree
    python-matplotlib
    #python-mapclassify
    #python-folium
    #python-xyzservices
    python-scipy
    python-geopy
    python-sqlalchemy
    python-psycopg2
    libspatialite
    #python-geoalchemy2
    python-pyarrow
    postgis
    ghostscript
)
# No tests data in Pypi
#source=(https://files.pythonhosted.org/packages/source/${_pkg::1}/${_pkg}/${_pkg}-${pkgver}.tar.gz)
source=(https://github.com/geopandas/geopandas/archive/refs/tags/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('e4c3bac0f9db6c28c65d1c96bcd75a7906b6c45b6da184ca4d635fb39268794b')

build() {
  cd ${_pkg}-${pkgver}
  python -m build --wheel --no-isolation
}

check() {
  cd ${_pkg}-${pkgver}
# failures due to pygeos https://github.com/geopandas/geopandas/pull/2689
  PYTHONPATH="${PWD}"/build/lib/ pytest -vv --color=yes -k 'not test_fillna_scalar and not test_repr_linearring'
}

package() {
  cd ${_pkg}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt -t "${pkgdir}"/usr/share/licenses/${pkgname}
}

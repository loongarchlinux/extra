# Maintainer: Bruno Pagani <archange@archlinux.org>

_pkg=xarray
pkgname=python-${_pkg}
pkgver=2023.09.0
pkgrel=1
pkgdesc="N-D labeled arrays and datasets in Python"
arch=(any)
url="https://xarray.pydata.org/"
license=(Apache)
depends=(python-numpy python-packaging python-pandas)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-setuptools-scm
  python-wheel
)
optdepends=(
  'python-netcdf4: netCDF4 support'
  'python-scipy: interpolation features & fallback for netCDF3 support'
#  'python-pydap: fallback for accessing OPeNDAP'
#  'python-h5netcdf: alternative for netCDF4 support'
#  'python-zarr: chunked, compressed N-dimensional arrays'
  'python-cftime: datetimes support for non-standard calendars or distant dates'
#  'python-pseudonetcdf: atmospheric science specific file formats support'
#  'python-rasterio: GeoTiffs and other gridded raster datasets support'
#  'python-iris: conversion to and from iris’ Cube objects'
#  'python-cfgrib: mapping GRIB files to CDF4'
  'python-bottleneck: faster NaN-skipping and rolling window aggregations'
#  'python-numbagg: faster exponential rolling window operations'
#  'python-flox: faster GroupBy reductions'
  'python-dask: parallel computation'
  'python-distributed: parallel computation'
  'python-matplotlib: plotting support'
#  'python-cartopy: plotting of cartographic data'
  'python-seaborn: better color palettes for plots'
#  'python-nc-time-axis: plotting of cftime.datetime objects'
#  'python-sparse: sparse arrays support'
  'python-pint: units of measure support'
)
checkdepends=(
  python-pytest
  python-pytest-xdist
  python-aiobotocore
  python-aiohttp
  python-bottleneck
  python-boto3
  python-cftime
  python-dask
  python-distributed
  python-fsspec
  python-h5py
  python-hypothesis
  python-lxml
  python-matplotlib
  python-netcdf4
  python-numexpr
  python-numpy
  python-pint
  python-requests
  python-scipy
  python-seaborn
)
#source=(https://files.pythonhosted.org/packages/source/${_pkg::1}/${_pkg}/${_pkg}-${pkgver}.tar.gz)
source=(https://github.com/pydata/xarray/archive/refs/tags/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('ee5856f66232e9f4c88791472dc5609c424483ea8bebd3f826f4700885ee418d')

build() {
  cd ${_pkg}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_pkg}-${pkgver}
  # https://github.com/pydata/xarray/issues/4281
  # and deselect tests already failing prior to Python 3.12
  pytest -vv -n 5 --color=yes \
    --deselect xarray/tests/test_distributed.py::test_serializable_locks \
    --deselect xarray/tests/test_dataset.py::TestDataset::test_drop_index_labels \
    --deselect xarray/tests/test_dataset.py::TestDataset::test_rename_multiindex \
    --deselect xarray/tests/test_backends.py::test_open_mfdataset_manyfiles \
    --deselect xarray/tests/test_backends.py::TestDask::test_save_mfdataset_compute_false_roundtrip \
    --deselect xarray/tests/test_dataarray.py::TestDataArray::test_unstack_roundtrip_integer_array
}

package() {
  cd ${_pkg}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
  # Remove tests
  rm -r "${pkgdir}"$(python -c "import site; print(site.getsitepackages()[0])")/xarray/tests
}

# Maintainer: Bruno Pagani <archange@archlinux.org>

_pkg=dask
pkgname=python-${_pkg}
pkgver=2024.4.1
pkgrel=2
pkgdesc="Parallel computing with task scheduling"
arch=(any)
url="https://dask.org"
license=(BSD)
depends=(
    mpdecimal
    python
    python-click
    python-cloudpickle
    python-fsspec
    python-importlib-metadata
    python-packaging
    python-partd
    python-pyyaml
    python-toolz
)
makedepends=(
    python-build
    python-installer
    python-setuptools
    python-versioneer
    python-wheel
)
optdepends=(
#    'python-bokeh: visualizing dask diagnostics'
#    'python-cityhash: faster hashing of arrays'
    'python-distributed: distributed computing'
#    'python-fastparquet: storing and reading data from parquet files'
#    'python-gcsfs: file-system interface to Google Cloud Storage'
#    'python-jinja: diagnostics'
#    'python-murmurhash: faster hashing of arrays'
    'python-numpy: arrays and dataframes support'
    'python-pandas: dataframes support'
    'python-psutil: more accurate CPU count'
    'python-pyarrow: Apache Arrow, for parquet support'
#    'python-s3fs: Amazon S3 support'
    'python-sqlalchemy: writing and reading from SQL databases'
    'python-xxhash: faster hashing of arrays'
)
checkdepends=(
    ipython
    python-pytest
    python-pytest-cov
    python-pytest-rerunfailures
    python-aiohttp
#    python-bokeh
    python-boto3
    python-botocore
    python-cytoolz
#    python-cityhash
    python-distributed
#    python-fastparquet
#    python-gcsfs
    python-graphviz
    python-h5py
    python-httpretty
    python-jinja
    python-jsonschema
    python-lz4
    python-matplotlib
    python-moto
#    python-murmurhash
#    python-numba
    python-numexpr
    python-numpy
    python-pandas
    python-psutil
    python-pyarrow
    python-pytables
    python-requests
#    python-s3fs
    python-scikit-learn
    python-scipy
    python-snappy
#    python-sparse
    python-sqlalchemy
    python-xarray
    python-xxhash
)
#source=(https://files.pythonhosted.org/packages/source/${_pkg::1}/${_pkg}/${_pkg}-${pkgver}.tar.gz)
source=(https://github.com/dask/dask/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz
        test-pandas-2.0)
sha256sums=('66dbfb2c0d8e7a6ccc5df669215efe99eaa3283878577311daf3736335fb8586'
            '9ddb45fefbfb1aaa3af20a6a2c6d4fcb20da5b3761e70313c92ae4f4f86634a2')

prepare() {
  cd ${_pkg}-${pkgver}
  sed -e 's|versioneer\[toml\].*\"|versioneer[toml]\"|g' -i pyproject.toml

  patch -p1 -i ../test-pandas-2.0 # Fix test with pandas 2.0 (Fedora)
}

build() {
  cd ${_pkg}-${pkgver}
  python -m build --wheel --no-isolation
}

check() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  local pytest_options=(
    -vv
    --deselect dask/dataframe/io/tests/test_sql.py::test_division_or_partition
    -k 'not test_RandomState_only_funcs'
    -W ignore::DeprecationWarning
  ) # https://github.com/dask/dask/issues/10418

  cd ${_pkg}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest "${pytest_options[@]}"
}

package() {
  cd ${_pkg}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt -t "${pkgdir}"/usr/share/licenses/${pkgname}/
}

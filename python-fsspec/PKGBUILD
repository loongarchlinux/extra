# Maintainer: Bruno Pagani <archange@archlinux.org>

_pkg=filesystem_spec
pkgname=python-fsspec
pkgver=2023.6.0
pkgrel=1
pkgdesc="Specification that python filesystems should adhere to."
arch=(any)
url="https://github.com/intake/filesystem_spec"
license=(BSD)
depends=(python)
makedepends=(python-setuptools)
optdepends=(
    'python-aiohttp: HTTP support'
    'python-distributed: Dask support'
    'python-libarchive-c: archives support'
    'python-lz4: LZ4 compression support'
    'python-paramiko: SFTP support'
    'python-pyarrow: Arrow/Parquet support'
    'python-pygit2: git support'
    'python-requests: web protocols support'
    'python-smbprotocol: SMB support'
    'python-snappy: snappy compression support'
    'python-zstandard: zstandard (zstd) compression support'
)
checkdepends=(git
    python-pytest
    python-pytest-asyncio
    python-pytest-mock
    python-pytest-vcr
    python-aiohttp
    python-dask
    python-distributed
    python-fastparquet
#    python-fusepy
    python-libarchive-c
    python-paramiko
    python-pyarrow
    python-pygit2
    python-requests
    python-smbprotocol
    python-cloudpickle
    python-jinja
    python-lz4
    python-msgpack
    python-numpy
    python-pandas
    python-pyftpdlib
    python-snappy
    python-tomli
    python-tqdm
    python-zstandard
    jupyter-notebook
)
source=(${url}/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('1417926a9832d82f93c7446bfcae266eade3985bf9d3f8a31917315cbd94fb72')

build() {
  cd ${_pkg}-${pkgver}
  python setup.py build
}

check() {
  cd ${_pkg}-${pkgver}
  # These tests do not work on CI, neither on our build server
  pytest -vv --color=yes -rs --deselect fsspec/implementations/tests/test_http.py::test_processes
}

package() {
  cd ${_pkg}-${pkgver}
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  # Install license file
  install -Dm644 LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}/
}

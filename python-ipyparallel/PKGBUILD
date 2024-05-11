# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Ashwin Vishnu <ashwinvis+arch at pr0t0nm4il dot com>
# Contributor: Specter119 <specter119 AT gmail DOT com>
# Contributor: xantares

_pyname=ipyparallel
pkgname=python-$_pyname
pkgver=8.8.0
pkgrel=2
pkgdesc='Interactive Parallel Computing in Python'
url='https://pypi.org/project/ipyparallel/'
arch=(any)
license=(BSD)
source=(https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.tar.gz)
depends=(ipython
         python
         python-dateutil
         python-decorator
         python-entrypoints
         python-ipykernel
         python-jupyter-client
         python-jupyter-core
         python-psutil
         python-pyzmq
         python-tornado
         python-tqdm
         python-traitlets)
makedepends=(python-build
             python-hatchling
             python-installer)
checkdepends=(python-pytest-asyncio
              python-pytest-tornado)
optdepends=('openmpi: to use the MPI Launchers in ipcluster command')
sha256sums=('2404d59f86a3aaa3bd27bf6b57df777bff5c1363c1c6e60403759d16ed42dc7b')

build() {
  cd $_pyname-$pkgver
  IPP_DISABLE_JS=1 \
  python -m build --wheel --no-isolation --skip-dependency-check
}

check() {
  cd $_pyname-$pkgver
  python -m installer --destdir=test_install dist/*.whl
  PYTHONPATH="$PWD"/test_install/`python -c "from sysconfig import get_path; print(get_path('platlib'))"` \
  pytest -v -k 'not test_local_ip_true_doesnt_trigger_warning' -W ignore::DeprecationWarning
}

package() {
  cd $_pyname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 COPYING.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  mv "$pkgdir"/{usr/,}etc
  rm -r "$pkgdir"/usr/lib/python*/site-packages/ipyparallel/tests
}

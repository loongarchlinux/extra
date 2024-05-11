# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Josh Holbrook <josh.holbrook@gmail.com>

pkgname=python-pyee
pkgver=11.0.1
pkgrel=2
pkgdesc="Port of node.js's EventEmitter to python"
arch=('any')
url=https://github.com/jfhbrook/pyee
license=('MIT')
depends=('python-typing_extensions')
makedepends=('python-build' 'python-installer' 'python-setuptools'
             'python-wheel')
checkdepends=('python-pytest-asyncio' 'python-pytest-trio' 'python-twisted')
optdepends=('python-trio' 'python-twisted')
source=("https://files.pythonhosted.org/packages/source/p/pyee/pyee-$pkgver.tar.gz")
sha256sums=('a642c51e3885a33ead087286e35212783a4e9b8d6514a10a5db4e57ac57b2b29')
b2sums=('ab1d37c6cd7e1d3e773011136b61581aecf009ce1831b9a583761c5b362a78d192abf57d683ba17be00159ecf3370dae641057aacaef208492d2f9b14de07aa7')

build() {
  cd pyee-$pkgver
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd pyee-$pkgver
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest
}

package() {
  cd pyee-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s "$site_packages"/pyee-$pkgver.dist-info/LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

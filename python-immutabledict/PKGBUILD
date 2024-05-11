# Maintainer: Alexander Epaneshnikov <alex19ep@archlinux.org>

pkgname=python-immutabledict
pkgver=4.1.0
pkgrel=2
pkgdesc="Immutable wrapper around dictionaries (a fork of frozendict)"
arch=('any')
url=https://github.com/corenting/immutabledict
license=('MIT')
depends=('python')
checkdepends=('python-pytest')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-poetry-core')
source=("$pkgname-$pkgver.tar.gz::https://github.com/corenting/immutabledict/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('a2a70cda9c837879ece3494f29e304625e25a6593d38dd7caafea6b0eb92c9b2b030ed9c48d7a9716b65ad7ea02cbc40410063df43d3aee12cecefbc8ff58127')

build() {
    cd "immutabledict-$pkgver"
    python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
    cd "immutabledict-$pkgver"
    python -m venv --system-site-packages test-env
    test-env/bin/python -m installer dist/*.whl
    PATH="$PWD/test-env/bin:$PATH" test-env/bin/python -m pytest
}

package() {
    cd "immutabledict-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}

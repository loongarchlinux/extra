# Maintainer: Alexander Epaneshnikov <alex19ep@archlinux.org>

pkgname=python-immutabledict
pkgver=3.0.0
pkgrel=1
pkgdesc="Immutable wrapper around dictionaries (a fork of frozendict)"
arch=('any')
url=https://github.com/corenting/immutabledict
license=('MIT')
depends=('python')
checkdepends=('python-pytest')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-poetry-core')
source=("$pkgname-$pkgver.tar.gz::https://github.com/corenting/immutabledict/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('f8ccce9efc64b5531ab4547924e13093bd12e0ad9a94988c6a57de47557a7f9f72f8f4de9b401d8fb971964fe36ca075b55e679d6080fc89a200fe6f73c2eef7')

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

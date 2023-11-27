# Maintainer: Jelle van der Waa <jelle@archlinux.org>
# Contributor: Giovanni Harting <539@idlegandalf.com>

pkgname=python-awesomeversion
_name=${pkgname#python-}
pkgver=23.11.0
pkgrel=2
pkgdesc="One version package to rule them all."
arch=('any')
url="https://github.com/ludeeus/awesomeversion"
license=('MIT')
depends=(python)
makedepends=(python-build python-installer python-poetry-core)
checkdepends=('python-pytest' 'python-pytest-snapshot')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ludeeus/$_name/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('1269a08e60bb43e03c9ed6c27d584f1cbdfd2d7f57c78e5a314f7f7c1bd9ae35b203f8065a9735e2743737283fa89216dbdee504f768626119723f5db49cba2b')

prepare() {
    cd $_name-$pkgver
    # version = "0"
    sed -e "s|version = \"0\"|version = \"$pkgver\"|" -i pyproject.toml
}

check() {
    cd $_name-$pkgver
    PYTHONPATH=. pytest tests
}

build() {
    cd $_name-$pkgver

    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver

    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENCE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

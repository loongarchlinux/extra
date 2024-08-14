# Maintainer: Alexander Epaneshnikov <alex19ep@archlinux.org>

pkgname=python-immutabledict
pkgver=4.2.0
pkgrel=1
pkgdesc="Immutable wrapper around dictionaries (a fork of frozendict)"
arch=('any')
url=https://github.com/corenting/immutabledict
license=('MIT')
depends=('python')
checkdepends=('python-pytest')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-poetry-core')
source=("$pkgname-$pkgver.tar.gz::https://github.com/corenting/immutabledict/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('d4177281134f73191f019a8cfe61752f6398b1bb36d9fad4c112c598be7664960eae8fdc4cd4bbce912dd93f599cd80761df03b49cf4fc57ac2ec3d3d2301a17')

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

# Maintainer: Morten Linderud <foxboron@archlinux.org>
# Contributor: JP Cimalando <jp-dev@inbox.ru>

pkgname=hy
epoch=1
pkgver=0.28.0
pkgrel=2
pkgdesc="A dialect of Lisp that's embedded in Python"
arch=('any')
url="http://hylang.org/"
license=('MIT')
depends=('python-funcparserlib')
makedepends=('python-setuptools' 'python-build' 'python-wheel' 'python-installer')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::https://github.com/hylang/hy/archive/$pkgver.tar.gz")
sha256sums=('f5ef595f1d596c489fc2db2f0f2244d9300ba0c8b7e213669aac01529256450b')

prepare() {
    cd "$pkgname-$pkgver"

    # usually generated from git metadata and aded to PyPI sdist
    # PyPI does not include testsuite files.
    echo "__version__ = '$pkgver'" > hy/version.py
}

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

check(){
    cd "$pkgname-$pkgver"

    export PYTHONDONTWRITEBYTECODE=0

    python setup.py develop --user
    PATH="$HOME/.local/bin:$PATH"
    pytest -k 'not test_correct_logic and not test_compact_logic'

    # Hy does magic to the bytecode, but we need this gone from check.
    # this should be generated as part of the build step
    for file in hy/contrib/__pycache__/__init__.cpython-*.pyc \
	hy/contrib/__pycache__/loop.cpython-*.pyc \
	hy/contrib/__pycache__/sequences.cpython-*.pyc \
	hy/contrib/__pycache__/walk.cpython-*.pyc \
	hy/core/__pycache__/__init__.cpython-*.pyc \
	hy/core/__pycache__/language.cpython-*.pyc \
	hy/core/__pycache__/macros.cpython-*.pyc \
	hy/core/__pycache__/shadow.cpython-*.pyc \
	hy/extra/__pycache__/__init__.cpython-*.pyc \
	hy/extra/__pycache__/anaphoric.cpython-*.pyc \
	hy/extra/__pycache__/reserved.cpython-*.pyc
    do
        rm "$file" || true
    done

}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    rm -rf "$pkgdir/usr/get_version"
}

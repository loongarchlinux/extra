# Maintainer: Florian Pritz <bluewind@xinu.at>

pkgname=python-ansi2html
_libname=${pkgname/python-/}
pkgver=1.9.1
pkgrel=3
pkgdesc="Convert text with ANSI color codes to HTML"
arch=('any')
url="https://github.com/pycontribs/ansi2html"
license=('LGPL-3.0-or-later')
depends=(python)
makedepends=(python-build python-installer python-wheel python-setuptools python-setuptools-scm)
checkdepends=(python-pytest)
source=(
  $pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz
)
sha256sums=('08395451ee39e661ad6e5449ff8334cf30bb9844755c666764c5d6bb08d758c5')
b2sums=('39e1ceab8301378812d2dc0f0e8b27f1f26b54040736ffcd0d7bb2078abc6033a8d88884bf9ffa685629d8e0d82502b9bdceb3119e005989285b329354194b25')
validpgpkeys=(94504C3AE11DD197920058ABA90ED7DE971095FF)

build() {
    cd "$_libname-$pkgver"
    SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver python -m build --wheel --no-isolation
}

check() {
    local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

    cd "$_libname-$pkgver"
    python -m installer --destdir=test_dir dist/*.whl
    export PYTHONPATH="test_dir/$_site_packages:$PYTHONPATH"
    export PATH="$PWD/test_dir/usr/bin:$PATH"
    pytest -vv
}

package() {
    cd "$_libname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

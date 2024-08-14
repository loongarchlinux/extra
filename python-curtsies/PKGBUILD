# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Kyle Keen <keenerd@gmail.com>

pkgname=python-curtsies
pkgver=0.4.2
pkgrel=4
pkgdesc='Curses-like terminal wrapper with a display based on compositing 2d arrays of text'
arch=('any')
url='https://github.com/bpython/curtsies'
license=('MIT')
depends=(
  'python'
  'python-blessed'
  'python-cwcwidth'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=('python-pyte' 'python-pytest')
source=("$pkgname::git+$url#tag=v$pkgver")
sha512sums=('2bf28ddaef73d4f42ca42919e5c9ec7dbaeed8f530c6dbd1d412db032032e1284f9bf99685cff558e521abc3acbac3d1bbe06da0dc00b6d27df5d53f2f636b13')
b2sums=('24450be8c76141abaac6db300afe7363056cbf7992c4de1edb99f37c38fcd473caab952c5e1e2f1219407412ad4b9eaef5ab482e13d1720000199cca2023572c')

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  # temporary install so pytest can pick up the compiled extension
  python -m installer --destdir="$(pwd)/tmp" dist/*.whl
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  export PYTHONPATH="$(pwd)/tmp/$site_packages"

  pytest -v
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

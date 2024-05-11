# Maintainer: George Rawlinson <george@rawlinson.net.nz>
# Contributor: Daniel M. Capella <polyzen@archlinux.org>

pkgname=python-flake8-black
pkgver=0.3.6
pkgrel=3
pkgdesc='Flake8 plugin to call black as a code style validator'
arch=('any')
url=https://github.com/peterjc/flake8-black
license=('MIT')
depends=(
  'python'
  'flake8'
  'python-black'
  'python-tomli'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
)
_commit='868b41554a6b57d74e916d33c37469e0d0b4b9cc'
source=(
  "$pkgname::git+$url#commit=$_commit"
  'pyproject-no-pip.patch'
)
sha512sums=('d68393ccca42afb7295ed1bcab4d478f9e9f934210ef666990ead0534d8f0ae3e9248828021b0ab1f36277a0c6588220650ac45fc3af28182a36d9fa0b9c6b56'
            '0dc458646781a621b571ac6a2ef892da242fa353b0be3e63a189ff0da8d0d10495521ff559072e50ada62e3565e43103cf605766b4cdf9f1b97a039a1ebd03fd')
b2sums=('4f0964a91c1477439bea4a30da69cc1f7bd8a20544cc6bc9a9adc31add0120ea083ece7ba2601f3dfea158b55c86df5a97ddda371afccadfd93bf1e0c21bd81c'
        'abc8840cf1cbf6b2386c38e690dcb479671cf2df64c584787f7ebb06c31dc3cec1d1d407e3bf3173460f31f8a61023bd1609e20fcac9317f67a3c18c610b2b19')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^v//'
}

prepare() {
  cd "$pkgname"

  patch -p1 -i "$srcdir/pyproject-no-pip.patch"
}

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

# Requires black==23.9.1 for tests
# https://github.com/peterjc/flake8-black/commit/8abe1ae59ee2b37b5c790152a7c7ba44118ebb8e
#check() {
#  cd "$pkgname"
#
#  python -m venv --system-site-packages test-env
#  source test-env/bin/activate
#  python -m installer dist/*.whl
#  cd tests
#  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
#  PYTHONPATH="../build:$site_packages" ./run_tests.sh
#  deactivate
#}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "$site_packages/flake8_black-$pkgver.dist-info/LICENSE.rst" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.rst"
}

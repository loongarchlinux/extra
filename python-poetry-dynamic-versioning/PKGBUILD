# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-poetry-dynamic-versioning
pkgver=1.0.1
pkgrel=1
pkgdesc='Plugin for Poetry to enable dynamic versioning based on VCS tags'
arch=('any')
url='https://github.com/mtkennerly/poetry-dynamic-versioning'
license=('MIT')
depends=(
  'python'
  'python-dunamai'
  'python-tomlkit'
  'python-jinja'
  'python-poetry'
  'python-cleo'
  'python-poetry-core'
  'python-packaging'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-poetry-core'
)
checkdepends=(
  'python-pytest'
  'python-pytest-cov'
)
_commit='4b305134be9dd3483629ef2d25d180ed2069c065'
source=(
  "$pkgname::git+$url#commit=$_commit"
  'fix-failing-test.patch'
)
b2sums=('SKIP'
        '60d5c434ac3bc87467c8f41f0938f56e0eae818f52d16d66cf3c21394f070e1248b16722a4f19b69422231fe0f1a88b5d10b638b69a03e26073fb821f452a7b5')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^v//'
}

prepare() {
  cd "$pkgname"

  patch -p1 -i "$srcdir/fix-failing-test.patch"
}

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  # integration tests are sketchy
  pytest -v tests/test_unit.py
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "$site_packages/poetry_dynamic_versioning-$pkgver.dist-info/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

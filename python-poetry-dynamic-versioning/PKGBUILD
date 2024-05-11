# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-poetry-dynamic-versioning
pkgver=1.2.0
pkgrel=2
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
_commit='dd9952fcb4c07d913112577af48ba736573b93e5'
source=("$pkgname::git+$url#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^v//'
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

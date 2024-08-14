# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Łukasz Tuz <lukasz.tuz@gmail.com>

pkgname=python-aiohappyeyeballs
_name=${pkgname#python-}
pkgver=2.3.5
pkgrel=1
pkgdesc='Happy Eyeballs for asyncio'
arch=(any)
url=https://github.com/aio-libs/aiohappyeyeballs
license=(PSF-2.0)
depends=(python)
makedepends=(
  git
  python-build
  python-installer
  python-poetry-core
)
checkdepends=(
  python-pytest
  python-pytest-asyncio
)
source=("git+$url.git#tag=v$pkgver")
b2sums=('dea5520f0abe658720f4dc35b0ea06fef461714a9c0e01c1ea3ef63f81c42d08996bc5be3e1a9649835b1b64919adf745206141df6d57ae0a2c80323645532e9')

build() {
  cd "$_name"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_name"
  # Override addopts as they invoke coverage testing
  pytest --override-ini="addopts=-v -Wdefault"
}

package() {
  cd "$_name"
  python -m installer --destdir="$pkgdir" dist/*.whl

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s "$site_packages"/"$_name"-$pkgver.dist-info/LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

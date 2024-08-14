# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Felix Kaiser <felix.kaiser@fxkr.net>

pkgname=python-pytest
_name=${pkgname#python-}
pkgver=8.3.2
pkgrel=1
epoch=1
pkgdesc="Simple powerful testing with Python"
arch=(any)
url=https://docs.pytest.org
license=(MIT)
depends=(
  python-iniconfig
  python-packaging
  python-pluggy
)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-setuptools-scm
  python-wheel
)
checkdepends=(
  python-argcomplete
  python-attrs
  python-hypothesis
  python-pygments
  python-requests
  python-xmlschema
  # Unlisted, but actually used. Check again after a while:
  lsof
  python-decorator
  python-docutils
  python-jinja
  python-numpy
  python-pexpect
  python-pytest-xdist
  python-twisted
)
source=("git+https://github.com/$_name-dev/$_name.git#tag=$pkgver")
b2sums=('bef53479cf4ccc74ffd06a7c75a019a6b97d2f8a7dec003f99396fa28a249ce38b37e52949166ac36664b4bb76d63a0c1cddeb291ab7e4ef192e43c9a1db05f4')

build() {
  cd "$_name"
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd "$_name"
  # https://github.com/pytest-dev/pytest/issues/10042
  PYTHONPATH="$PWD/src:$PYTHONPATH" pytest -o xfail_strict=False
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

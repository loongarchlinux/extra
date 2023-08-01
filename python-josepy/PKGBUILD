# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=python-josepy
pkgver=1.13.0
pkgrel=4
pkgdesc='JOSE protocol implementation in Python'
arch=('any')
url='https://github.com/certbot/josepy'
license=('Apache')
depends=(
  'python'
  'python-cryptography'
  'python-pyopenssl'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=('python-pytest')
_commit='10e2e3a1c09974d41097cc4c08f836421ce39f1b'
source=("$pkgname::git+$url#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^v//'
}

prepare() {
  cd "$pkgname"

  # thou shalt not enforce coverage in distro packaging
  # https://github.com/certbot/josepy/issues/34
  rm pytest.ini

  # nuke setuptools from orbit ^W install_requires
  sed \
    -e '/setuptools>=/d' \
    -i setup.py
}

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  PYTHONPATH="$(pwd)/build/lib" pytest -v
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl
}

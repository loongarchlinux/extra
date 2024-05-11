# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=python-pyopenssl
pkgver=24.0.0
pkgrel=2
pkgdesc='Python wrapper around the OpenSSL library'
arch=('any')
url='https://pyopenssl.org/'
license=('Apache')
depends=('python' 'python-cryptography')
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=('python-pytest' 'python-pretend' 'python-flaky')
_commit='7f3e4f94701a5e19ec66e3601119dd6d62043cec'
source=("$pkgname::git+https://github.com/pyca/pyopenssl#commit=$_commit")
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

  PYTHONPATH="$PWD"/build/lib pytest -v
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
# vim: ts=2 sw=2 et:

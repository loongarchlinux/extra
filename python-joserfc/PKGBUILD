# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>

pkgname=python-joserfc
# https://github.com/authlib/joserfc/releases
pkgver=0.9.0
# curl https://api.github.com/repos/authlib/joserfc/git/ref/tags/$pkgver | jq -r .object.sha
_commit=b669af5fbf17ad500893004299debe006885dd97
pkgrel=2
pkgdesc='Implementations of JOSE RFCs in Python'
arch=(any)
url='https://github.com/authlib/joserfc'
# https://github.com/authlib/joserfc/blob/0.9.0/pyproject.toml#L8
license=('BSD-3-Clause')
depends=(python python-cryptography)
makedepends=(git python-build python-installer python-setuptools python-wheel
             python-pycryptodome)
checkdepends=(python-pytest)
optdepends=(
  'python-pycryptodome: for draft RFCs'
)
source=("git+$url?signed#commit=$_commit")
sha256sums=('SKIP')
validpgpkeys=(
  # A key in https://github.com/lepture.gpg
  '72F8E895A70CEBDF4F2ADFE07E55E3E0118B2B4C'
)

pkgver() {
  cd joserfc
  git describe --tags
}

build() {
  cd joserfc
  python -m build --wheel --no-isolation
}

check() {
  cd joserfc
  pytest
}

package() {
  cd joserfc
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D -m644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}

# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=python-dkim
pkgver=1.1.6
pkgrel=1
pkgdesc='Python library that implements DKIM and ARC email signing and verification'
arch=('any')
url=https://launchpad.net/dkimpy
license=('ZLIB')
depends=('python-dnspython')
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=('python-authres' 'python-pynacl')
optdepends=('python-aiodns' 'python-authres' 'python-pynacl')
source=("https://files.pythonhosted.org/packages/source/d/dkimpy/dkimpy-$pkgver.tar.gz")
sha256sums=('0ce72d961f443e8f9f05694b354542dee534e08e2b8c5b60c62d5daca7c1da0f')
b2sums=('89e6752b97611eba5ecf0f487d10b3210f7b898131e465639aa0a8f2120c3a2901ad844db275748148574cbfcd1a5eeaf3319c09172b51d7a79342a0ee16f285')

build() {
  cd dkimpy-$pkgver
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd dkimpy-$pkgver
  python -m unittest dkim.tests.test_suite
}

package() {
  cd dkimpy-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s "$site_packages"/dkimpy-$pkgver.dist-info/LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

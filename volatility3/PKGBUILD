# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Wes Brown <wesbrown18@gmail.com>

pkgname=volatility3
pkgver=2.5.0
pkgrel=1
pkgdesc='Advanced memory forensics framework'
url='https://github.com/volatilityfoundation/volatility3/wiki'
arch=('any')
license=('custom')
depends=(
  'python' 'python-yara' 'python-capstone' 'python-jsonschema'
  'python-pycryptodome' 'python-pefile' 'python-snappy')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
provides=('volatility')
replaces=('volatility')
source=(https://github.com/volatilityfoundation/volatility3/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('efe7799c57fd4d8970c50c96a05d83a161149a26f944963e66af33e46a8fc6e524b67db0ac6b5e2bba93ff1d116e84d2d902398c02311c9504f4da7b85e49109')
b2sums=('b751dab43293380eddfa621742d41b8582785a8277f94e06ffc7e1efa9732bedff5918828494cdb0d710a43cc9759ffba1c762b504f58d6e5e4a6172b8a5ba4a')

build() {
  cd ${pkgname}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd ${pkgname}-${pkgver}
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:

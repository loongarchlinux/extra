# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Wes Brown <wesbrown18@gmail.com>

pkgname=volatility3
pkgver=2.5.2
pkgrel=2
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
sha512sums=('02cfd06928f1667ec481e776c45e954d4a40fa6da6ffbdd30e0980bd5d09ce70d0e31de6e352a833c36045e67c2120ea6a10e2d3ec1327e9e4e4e1c2af494fcf')
b2sums=('d6ea1b4a1fad3bcda8fbb38372a492d59659061e2cb9e7915a4f5d46af2fcdba0402b83575e5b5017f00f32975e98281c2885d7c9cfa576a3ee4a41f75f126a7')

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

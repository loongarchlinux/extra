# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Wes Brown <wesbrown18@gmail.com>

pkgname=volatility3
pkgver=2.7.0
pkgrel=1
pkgdesc='Advanced memory forensics framework'
url='https://github.com/volatilityfoundation/volatility3/wiki'
arch=(any)
license=(custom)
depends=(
  python
  python-capstone
  python-jsonschema
  python-pefile
  python-pycryptodome
  python-snappy
  python-yara
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
provides=(volatility)
replaces=(volatility)
source=(https://github.com/volatilityfoundation/volatility3/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('bb9f79604ce2e647d42a1003941802a69ecdf845c1400b1d3f67e13494a228c99269478d635fbcdcde8ae67b792b73e07e7e26ce9a8e2e7b80185af7cc7ac3c0')
b2sums=('aa7209be5a3cb33b2f5b9fac52e3098407926b8135d2d5566746e0156d3873195ce9161e5652c2abf80e9bfd2955e7d02985ce75ac7fca3559d821866d0302cf')

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

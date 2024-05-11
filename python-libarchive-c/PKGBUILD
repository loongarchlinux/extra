# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=python-libarchive-c
pkgver=5.1
pkgrel=2
pkgdesc='Python interface to libarchive'
url='https://github.com/Changaco/python-libarchive-c'
arch=('any')
license=('CC0-1.0')
depends=('python' 'libarchive')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=(https://github.com/Changaco/python-libarchive-c/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('a2026aba3ef325f10e981e15e50de0435d7371642b0e6df8cd5ab64e76186b2a72297b32f429547e091fb799c9d0fa41be5a6824408c08f6c71585d59175d7a0')
b2sums=('5b727c88eca866f69eda701ca8898d4bd3b68adefb8234a501cb280fae2be98f1314bb64ff94bcc5e1c0cae9ffc6866ee70aa4fbc4353eac1f16d59f9a789ebc')

prepare() {
  sed '/os.umask(2)/d' -i ${pkgbase}-${pkgver}/setup.py
  cd ${pkgbase}-${pkgver}
}

check() {
  cd ${pkgbase}-${pkgver}
  LC_CTYPE=en_US.UTF-8 py.test
}

build() {
  cd ${pkgbase}-${pkgver}
  python setup.py build
}

package() {
  cd ${pkgbase}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --skip-build
  install -Dm 644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:

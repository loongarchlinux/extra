# Maintainer: Andrew Crerar <crerar@archlinux.org>
# Contributor: Kevin Azzam <aur@azz.am>
# Contributor: David Runge <dave@sleepmap.de>

pkgname=python-dotenv
pkgver=1.0.1
pkgrel=2
pkgdesc="Get and set values in your .env file in local and production servers"
arch=('any')
url="https://github.com/theskumar/python-dotenv/"
license=('BSD')
depends=('python-click')
makedepends=('python-setuptools')
optdepends=('ipython: ipython support')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/theskumar/python-dotenv/archive/v${pkgver}.tar.gz")
b2sums=('98d38adf2bf8ad70f2bcc182ba0cdfd08b40500cc6209a5a529a3933b060a196bb5fbc2099bc8f498f5c9e1dc6db27510d8bac891b28509241ed0a8742b8da51')

build() {
    cd "${pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${pkgname}-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

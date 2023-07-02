# Maintainer: Alexander Epaneshnikov <alex19ep@archlinux.org>
# Contributor: Storm Dragon <stormdragon2976@gmail.com>

pkgname=python-txtorcon
pkgver=23.5.0
pkgrel=1
pkgdesc='A Twisted-based Python asynchronous controller library for Tor'
arch=('any')
url='https://txtorcon.readthedocs.org/'
license=('MIT')
depends=('python-automat' 'python-twisted')
makedepends=('python-setuptools')
checkdepends=('python-mock' 'python-cryptography' 'python-pyopenssl' 'lsof')
source=("${pkgname#python-}-${pkgver}.tar.gz::https://github.com/meejah/txtorcon/releases/download/v${pkgver}/txtorcon-${pkgver}.tar.gz"
        "${pkgname#python-}-${pkgver}.tar.gz.asc::https://github.com/meejah/txtorcon/releases/download/v${pkgver}/txtorcon-${pkgver}.tar.gz.asc")
sha512sums=('68b4ddf22e4d00c8f5f964ccf192dec884434b96668c4f71de5e80170724e04e8ca96d0405fe773a5e86b357012120fe6a34a847cbd3db3e4e360b01e593db9c'
            'SKIP')
validpgpkeys=('9D5A2BD5688ECB889DEBCD3FC2602803128069A7')

build() {
	cd "${pkgname#python-}-${pkgver}"
	python setup.py build
}

check() {
	cd "${pkgname#python-}-${pkgver}"
	PYTHONPATH=. trial test
}

package() {
	cd "${pkgname#python-}-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	rm -r "${pkgdir}/usr/share/txtorcon"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

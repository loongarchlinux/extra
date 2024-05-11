# Maintainer: Alexander Epaneshnikov <alex19ep@archlinux.org>
# Contributor: Storm Dragon <stormdragon2976@gmail.com>

pkgname=python-txtorcon
pkgver=23.11.0
pkgrel=3
pkgdesc='A Twisted-based Python asynchronous controller library for Tor'
arch=('any')
url='https://txtorcon.readthedocs.org/'
license=('MIT')
depends=(
	'python'
	'python-automat'
	'python-cryptography'
	'python-idna'  # via twisted[tls]
	'python-pyopenssl'  # via twisted[tls]
	'python-service-identity'  # via twisted[tls]
	'python-six'  # https://github.com/meejah/txtorcon/issues/395
	'python-twisted'
	'python-zope-interface'
)
makedepends=(
	'python-build'
	'python-installer'
	'python-setuptools'
	'python-wheel'
)
checkdepends=('python-cryptography' 'python-pyopenssl' 'lsof')
source=("${pkgname#python-}-${pkgver}.tar.gz::https://github.com/meejah/txtorcon/releases/download/v${pkgver}/txtorcon-${pkgver}.tar.gz"
        "${pkgname#python-}-${pkgver}.tar.gz.asc::https://github.com/meejah/txtorcon/releases/download/v${pkgver}/txtorcon-${pkgver}.tar.gz.asc")
sha512sums=('abc9776ad6e071a09f13e54c7582b5adab17efc752d485ff7a94baa3e71eb9c093983ceebeebd2218c85ed193bfd0b39dcd11a73d54bd2a28f9d9b2b9149ecd6'
            'SKIP')
validpgpkeys=('9D5A2BD5688ECB889DEBCD3FC2602803128069A7')

build() {
	cd "${pkgname#python-}-${pkgver}"
	python -m build --wheel --no-isolation
}

check() {
	cd "${pkgname#python-}-${pkgver}"
	PYTHONPATH=. trial test
}

package() {
	cd "${pkgname#python-}-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	rm -r "${pkgdir}/usr/share/txtorcon"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# Maintainer: Alexander Epaneshnikov <alex19ep@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Storm Dragon <stormdragon2976@gmail.com>

pkgname=magic-wormhole
pkgver=0.13.0
pkgrel=1
pkgdesc="Securely transfer data between computers"
arch=('any')
url="https://github.com/magic-wormhole/magic-wormhole"
license=('MIT')
depends=('python-click' 'python-cffi' 'python-autobahn' 'python-tqdm'
         'python-hkdf' 'python-pynacl' 'python-spake2' 'python-humanize'
         'python-idna' 'python-service-identity' 'python-txtorcon'
         'python-pyopenssl')
makedepends=(python-{build,installer,wheel}
             python-setuptools)
checkdepends=('python-mock' 'python-magic-wormhole-transit-relay'
              'python-magic-wormhole-mailbox-server')
source=("$url/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('5a3ade0853511d5bf059814dc43bb2d27d8e733804ab6370a6a18c6eff34df672f0ec1b550ed18c79a99566f4dcc1c390d0dd1171c172f55f1352eb447707a64')

build() {
	cd "${pkgname}-${pkgver}"
	python -m build -wn
}

check() {
	cd "${pkgname}-${pkgver}"
	python -m unittest discover
}

package() {
	cd "${pkgname}-${pkgver}"
	python -m installer -d "$pkgdir" dist/*.whl
	install -vDm 644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
	install -vDm 644 -t "$pkgdir/usr/share/doc/$pkgname/" docs/*.md
	install -vDm 644 -t "$pkgdir/usr/share/man/man1/" docs/wormhole.1
}

# Maintainer: Alexander Epaneshnikov <alex19ep@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Storm Dragon <stormdragon2976@gmail.com>

pkgname=magic-wormhole
pkgver=0.12.0
pkgrel=9
pkgdesc="Securely transfer data between computers"
arch=('any')
url="https://github.com/magic-wormhole/magic-wormhole"
license=('MIT')
depends=('python-click' 'python-cffi' 'python-autobahn' 'python-tqdm'
         'python-hkdf' 'python-pynacl' 'python-spake2' 'python-humanize'
         'python-idna' 'python-service-identity' 'python-txtorcon'
         'python-pyopenssl' 'python-setuptools'
         'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-mock' 'python-magic-wormhole-transit-relay'
              'python-magic-wormhole-mailbox-server')
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/magic-wormhole/magic-wormhole/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('141244e746b0718f2c9417e8f7de6a714b0feb051aea8c7950ea0d1bc5d2e24e922bed29544fe76aa61b06aa2ce2b5f330824017af8c6030813415e6c004c716')

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

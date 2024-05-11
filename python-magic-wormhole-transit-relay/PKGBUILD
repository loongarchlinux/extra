# Maintainer: Alexander Epaneshnikov <alex19ep@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-magic-wormhole-transit-relay
pkgver=0.2.1
pkgrel=10
pkgdesc="transit Relay server for Magic-Wormhole"
arch=('any')
url="https://github.com/magic-wormhole/magic-wormhole-transit-relay"
license=('MIT')
depends=('python-twisted' 'python-autobahn')
makedepends=(python-{build,installer,wheel}
             python-setuptools python-versioneer)
checkdepends=(python-pytest)
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/magic-wormhole/magic-wormhole-transit-relay/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('dcc309de800d9023ff106ea7b67da4814006ee50e517570c046f2dff20573306b3d5f7c4e227186b2b6f8ff7cb71e02e41499766badf299d859a0e5628066162')
b2sums=('ffb05c716a35e688801150c3fd6de28cf557ed346091400f9eeb9335b6815425624e70d61f54be8f0a1e8bb15e874528f7cfcef1e8f0a2f8d3cd4285adb1db3a')

prepare() {
	cd "${pkgname#python-}-$pkgver"
	# https://github.com/magic-wormhole/magic-wormhole/issues/439
	sed -i -E '/^import mock$/s/.*/from unittest import mock/' src/wormhole_transit_relay/test/*.py

	# De-vendor old versioneer copy, incompatible with 3.12
	rm versioneer.py
}

build() {
	cd "${pkgname#python-}-${pkgver}"
	python -m build -wn
}

check() {
	cd "${pkgname#python-}-${pkgver}"
	pytest
}

package() {
	cd "${pkgname#python-}-${pkgver}"
	python -m installer -d "$pkgdir" dist/*.whl
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
	install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname" docs/*.md
}

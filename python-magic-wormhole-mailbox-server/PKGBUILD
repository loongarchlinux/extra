# Maintainer: Alexander Epaneshnikov <alex19ep@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Dian M Fay <dian.m.fay@gmail.com>

pkgname=python-magic-wormhole-mailbox-server
pkgver=0.4.1
pkgrel=11
pkgdesc="the rendezvous/mailbox server for magic-wormhole clients "
arch=('any')
url="https://github.com/magic-wormhole/magic-wormhole-mailbox-server"
license=('MIT')
depends=('python-twisted' 'python-autobahn')
makedepends=(python-{build,installer,wheel}
             python-setuptools
             python-versioneer)
checkdepends=(python-pytest
              python-treq)
source=(${pkgname}-${pkgver}.tar.gz::"${url}/archive/refs/tags/${pkgver}.tar.gz"
        "00-no-universal-newlines-mode.patch")
sha512sums=('d174d1bf901e7d21d7cb77ceffd6b9c7aa3c15433e11862365883d93437225c7c655b8338a5cad7bd5c60d7dd7d3dd017ef7e26213b535c043ce75000a540597'
            'a746512188e9e01e1b09a9a3436b70d99d5ce001e11d8058e78d5327f0e7c5eb7d013722012156489708bd9c1951756651795e688d18094e70b263f5460a689b')
b2sums=('4bf6bc9fa6dacaafb532d9d0ee069bb89ba63feb790f0f9c0d1117b1de4f075eb9dd3bf5c72a9df472e9dedc31dcd9292dc1820da770738fd9d0d29cb3bcf68a'
        '324e1e08c883ef67740dff738c7891b610a79d8eb793b137e9d015ab7580c6b6564cdc09d959c17f1b5524cacabf0f4607fb838e614fc5d3974f7986e594c233')

prepare() {
	cd "${pkgname#python-}-$pkgver"
	# vendored versioneer is too old for Python 3.12
	rm -f versioneer.py
	patch -Np1 -i ../00-no-universal-newlines-mode.patch
	# https://github.com/magic-wormhole/magic-wormhole/issues/439
	sed -i -E '/^import mock$/s/.*/from unittest import mock/' src/wormhole_mailbox_server/test/*.py
}

build() {
	cd "${pkgname#python-}-$pkgver"
	python -m build -wn
}

check() {
	cd "${pkgname#python-}-$pkgver"
	export PYTHONPATH='src'
	pytest
}

package() {
	cd "${pkgname#python-}-$pkgver"
	python -m installer -d "$pkgdir" dist/*.whl
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
	install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname" docs/*.md
}

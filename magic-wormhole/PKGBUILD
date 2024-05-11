# Maintainer: Alexander Epaneshnikov <alex19ep@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Storm Dragon <stormdragon2976@gmail.com>

pkgname=magic-wormhole
pkgver=0.14.0
pkgrel=8
pkgdesc="Securely transfer data between computers"
arch=(any)
url="https://github.com/magic-wormhole/magic-wormhole"
license=(MIT)
depends=(python-autobahn
         python-cffi
         python-click
         python-hkdf
         python-humanize
         python-idna
         python-iterable-io
         python-pynacl
         python-pyopenssl
         python-service-identity
         python-spake2
         python-tqdm
         python-txtorcon
         python-zipstream-ng)
makedepends=(python-{build,installer,wheel}
             python-setuptools)
checkdepends=(python-magic-wormhole-mailbox-server
              python-magic-wormhole-transit-relay
              python-noiseprotocol
              python-pytest
              python-pytest-mock)
_archive="$pkgname-$pkgver"
source=("$url/archive/$pkgver/$_archive.tar.gz")
sha512sums=('6b236455811cb2800cbf708f2aca7960d0eeb8f1705d8d4b18760686dfc5395ea4307328514d37329d527e7635a36c0732a7cf763f91d71f77e816f2d98e82fb')

build() {
	cd "$_archive"
	python -m build -wn
}

check() {
	cd "$_archive"
	export PYTHONPATH=src
	local deselected=(
		# uses unittest.mock wrong and triggers new Python's errors
		src/wormhole/test/test_tor_manager.py
	)
	pytest ${deselected[@]/#/--deselect }
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
	install -vDm 644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
	install -vDm 644 -t "$pkgdir/usr/share/man/man1/" docs/wormhole.1
	mkdir -p "$pkgdir/usr/share/"{bash_completion/completions,fish/vendor_completions.d,zsh/site-functions}/
	mv "$pkgdir/usr/"{wormhole_complete.bash,share/bash_completion/completions/wormhole}
	mv "$pkgdir/usr/"{wormhole_complete.fish,share/fish/vendor_completions.d/wormhole.fish}
	mv "$pkgdir/usr/"{wormhole_complete.zsh,share/zsh/site-functions/_wormhole}
}

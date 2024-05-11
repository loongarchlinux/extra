# Maintainer: Jonas Witschel <diabonas@archlinux.org>
pkgname=python-oscrypto
pkgver=1.3.0
pkgrel=6
pkgdesc='Compiler-free Python crypto library backed by the OS'
arch=('any')
url='https://github.com/wbond/oscrypto'
license=('MIT')
depends=('openssl' 'python' 'python-asn1crypto')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
	"replace-removed-imp-module.patch")
sha512sums=('b5baf72e1a09615b267be4d1c4baf2375bb939b5bd3d717ca9ca70776541f590a8608bef95991967e23f3794e6220709ed2fe5acdedfe9bfce1921c879a74bec'
            '3947d3e975d0fe17b3b25524a0b77de9b41b8e537283422b4074a33645ce36688270d89bf9eb728e967f1a217629a78e362949428ab95d78267d39a3709264a8')

prepare() {
	cd "${pkgname#python-}-$pkgver"
	patch -Np1 -i ${srcdir}/replace-removed-imp-module.patch
}

build() {
	cd "${pkgname#python-}-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	local pytest_options=(
		# https://github.com/wbond/oscrypto/issues/73
		--deselect tests/test_tls.py::TLSTests::test_tls_connect_dh1024
		--deselect tests/test_tls.py::TLSTests::test_tls_error_client_cert_required
		--deselect tests/test_tls.py::TLSTests::test_tls_error_domain_mismatch
		--deselect tests/test_tls.py::TLSTests::test_tls_error_san_mismatch
		--deselect tests/test_tls.py::TLSTests::test_tls_error_wildcard_mismatch
		--deselect tests/test_tls.py::TLSTests::test_tls_extra_trust_roots
		--deselect tests/test_tls.py::TLSTests::test_tls_wildcard_success
		# https://github.com/wbond/oscrypto/issues/80
		--deselect tests/test_tls.py::TLSTests::test_tls_error_http
		--deselect tests/test_tls.py::TLSTests::test_tls_error_weak_dh_params
	)

	cd "${pkgname#python-}-$pkgver"
	pytest "${pytest_options[@]}"
}

package() {
	cd "${pkgname#python-}-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

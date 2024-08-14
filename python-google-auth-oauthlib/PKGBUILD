# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-google-auth-oauthlib
pkgver=1.2.1
pkgrel=1
pkgdesc="oauthlib integration for Google auth."
url="http://google-auth-oauthlib.readthedocs.io/en/latest/"
checkdepends=('python-click' 'python-pytest')
makedepends=('python-setuptools')
depends=('python' 'python-google-auth' 'python-requests-oauthlib')
optdepends=('python-click')
license=('Apache')
arch=('any')
source=("$pkgname-$pkgver.tar.gz::https://github.com/googleapis/google-auth-library-python-oauthlib/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9c5bebe2d0c4d65f7904b17dd21a2c4d7229fa8702ec910a75d48abf9f533075')

# check() {
#     cd "google-auth-library-python-oauthlib-${pkgver}"
#     pytest
# }

package() {
    cd "google-auth-library-python-oauthlib-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
    install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE

    # Remove conflicting files
    local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
    rm -r "${pkgdir}/usr/lib/python${python_version}/site-packages/docs"
}

# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>
# Maintainer: Alexander Epaneshnikov <alex19ep@archlinux.org>
# Maintainer: T.J. Townsend <blakkheim@archlinux.org>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Kaiting Chen <kaitocracy@gmail.com>
# Contributor: Simon Lipp <aur@simon.lipp.name>
# Contributor: Daniel Grana <dangra@gmail.com>

pkgname=s3cmd
pkgver=2.4.0
pkgrel=1
pkgdesc="A command line client for Amazon S3"
arch=('any')
url='http://s3tools.org/s3cmd'
license=('GPL2')
depends=('python-dateutil' 'python-magic')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
optdepends=('gnupg: encrypted file storage')
source=(https://github.com/s3tools/s3cmd/releases/download/v${pkgver}/s3cmd-${pkgver}.tar.gz{,.asc})
sha512sums=('78a7fb193ef94759e6b59c8bccc2e736f4195f7de781f6a5d11a5685a3cf93ca9ef946bdefbfe0b0dafd0ea0612c8944283c3177f280d14edfca6553e62e0b49'
            'SKIP')
validpgpkeys=('0D37A8F4A5D183D5541D85D9241769189AC3D00B'
              '795A7DA5202E1139EB56177A52246AF8C9D9148D')

build() {
  cd "${pkgname}-${pkgver}"
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>
# Maintainer: Alexander Epaneshnikov <alex19ep@archlinux.org>
# Maintainer: T.J. Townsend <blakkheim@archlinux.org>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Kaiting Chen <kaitocracy@gmail.com>
# Contributor: Simon Lipp <aur@simon.lipp.name>
# Contributor: Daniel Grana <dangra@gmail.com>

pkgname=s3cmd
pkgver=2.4.0
pkgrel=3
pkgdesc="A command line client for Amazon S3"
arch=('any')
url='http://s3tools.org/s3cmd'
license=('GPL2')
depends=('python-dateutil' 'python-magic')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')
optdepends=('gnupg: encrypted file storage')
source=(git+https://github.com/s3tools/s3cmd.git?signed#tag=v${pkgver})
sha512sums=('d3f57419fd963de50611f78a8b8908fc674fd36ef6e15d3c7a4d72b623816eb70c7cb02a059c0b9542bf5e1f4e61015989dd0c85cf53910fdbda8bb613f93888')
validpgpkeys=('0D37A8F4A5D183D5541D85D9241769189AC3D00B'
              '795A7DA5202E1139EB56177A52246AF8C9D9148D')

build() {
  cd "${pkgname}"
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd "${pkgname}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

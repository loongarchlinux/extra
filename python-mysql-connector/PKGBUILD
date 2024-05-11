# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Evgeniy Alekseev <arcanis at archlinux dot org>
# Contributor: Raphaël Doursenaud <rdoursenaud at free dot fr>

pkgname=python-mysql-connector
_pkgname=mysql-connector-python
pkgver=8.4.0
pkgrel=1
pkgdesc="A standardized database driver for Python platforms and development"
arch=('any')
url="https://dev.mysql.com/downloads/connector/python/"
license=('GPL-2.0-only')
depends=('python' 'python-dnspython' 'python-typing_extensions')
makedepends=(python-build python-installer python-wheel python-setuptools)
source=("https://cdn.mysql.com//Downloads/Connector-Python/${_pkgname}-${pkgver}-src.tar.gz"
		 "${_pkgname}-${pkgver}-src.tar.gz.asc::https://dev.mysql.com/downloads/gpg/?file=${_pkgname}-${pkgver}-src.tar.gz&p=29")
sha512sums=('ab4319f551affa801278a548f4a111699ad54058ecc4aa185d83f529fe8e381cc0810cc98eeef496a8e14b575cd69a6fbbb5ba079a0e06e0222d05b08038e013'
            'SKIP')
validpgpkeys=('859BE8D7C586F538430B19C2467B942D3A79BD29'
              'BCA43417C3B485DD128EC6D4B7B3B788A8D3785C')  # MySQL Release Engineering <mysql-build@oss.oracle.com>

build() {
	cd "${_pkgname}-${pkgver}-src"
	python -m build --wheel --no-isolation mysql-connector-python/
	python -m build --wheel --no-isolation mysqlx-connector-python/
}

package() {
	cd "${_pkgname}-${pkgver}-src"
	python -m installer --destdir="$pkgdir" mysql-connector-python/dist/*.whl
	python -m installer --destdir="$pkgdir" mysqlx-connector-python/dist/*.whl
}

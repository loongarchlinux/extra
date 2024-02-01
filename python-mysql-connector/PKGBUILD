# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Evgeniy Alekseev <arcanis at archlinux dot org>
# Contributor: Raphaël Doursenaud <rdoursenaud at free dot fr>

pkgname=python-mysql-connector
_pkgname=mysql-connector-python
pkgver=8.3.0
pkgrel=2
pkgdesc="A standardized database driver for Python platforms and development"
arch=('any')
url="https://dev.mysql.com/downloads/connector/python/"
license=('GPL')
depends=('python' 'python-dnspython' 'python-typing_extensions')
makedepends=(python-build python-installer python-wheel python-setuptools)
source=("https://cdn.mysql.com//Downloads/Connector-Python/${_pkgname}-${pkgver}-src.tar.gz"
		 "${_pkgname}-${pkgver}-src.tar.gz.asc::https://dev.mysql.com/downloads/gpg/?file=${_pkgname}-${pkgver}-src.tar.gz&p=29")
sha512sums=('b04e439750f5b9ca84ea9a7acb935cd750b6b1955914138a96c891b8e3b4dd1fb5dd47f9d0ecd55f2a12d464f899d30a78806603177de0d1029f333e60c04cc7'
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

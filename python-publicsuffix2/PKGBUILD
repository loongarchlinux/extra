# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=python-publicsuffix2
_name="${pkgname#python-}"
# bizarre tagging: https://github.com/nexB/python-publicsuffix2/issues/12
_version=2.2019-12-21
pkgver=2.20191221
pkgrel=8
pkgdesc="Library to deal with publicsuffix data"
arch=(any)
url="https://github.com/nexB/python-publicsuffix2"
license=(
  MIT
  MPL-2.0
)
depends=(
  publicsuffix-list
  python
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(python-pytest)
source=($pkgname-$pkgver.tar.gz::$url/archive/release-$_version.tar.gz)
sha512sums=('983bdb17b76d10eb73cf69f0ba7590806bf6786ae0c30526593ce1ab97f3b22c967f9acae83b880dd56be41a29eae9cca5726926667eb74013d0d1078433bf05')

prepare() {
  cd $pkgname-release-$_version
  # we rely on publicsuffix-list and do not need/want to download a new list during build
  sed -e "/'requests/d" -i setup.py
}

build() {
  cd $pkgname-release-$_version
  python -m build --wheel --no-isolation
}

check() {
  cd $pkgname-release-$_version
  export PYTHONPATH="build/lib:$PYTHONPATH"
  pytest -v
}

package() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $pkgname-release-$_version
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 {AUTHORS,CHANGELOG,README}.rst -t "$pkgdir/usr/share/doc/$pkgname/"
  install -vDm 644 "$_name.LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
  # use the system provided publicsuffix list (publicsuffix-list package)
  ln -svf /usr/share/publicsuffix/public_suffix_list.dat "$pkgdir/$site_packages/$_name/public_suffix_list.dat"
}

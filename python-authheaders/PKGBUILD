# Maintainer: David Runge <dvzrv@archlinux.org>

_name=authheaders
pkgname=python-authheaders
pkgver=0.16.2
# last updated as per https://www.psddmarc.org/registry.html
_version=2023.09.02
pkgrel=2
pkgdesc="Library for the generation of email authentication headers"
arch=(any)
url="https://github.com/ValiMail/authentication-headers"
license=(
  MPL-2.0
  ZPL-2.1
  Zlib
)
depends=(
  publicsuffix-list
  python
  python-authres
  python-dkim
  python-dnspython
  python-publicsuffix2
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(python-pytest)
source=(
  $url/releases/download/$pkgver/$_name-$pkgver.tar.gz{,.asc}
  psddmarc-$_version.csv::https://www.psddmarc.org/psddmarc-participants.csv
)
sha512sums=('2d5390cdbf2f7225a172f23ddd845f9126b909a7fd558ff96334886dd8d9792887c247596ca22d7bc5a0d8fea0f03481ccb61d934835de4790312b27ef6c6bd5'
            'SKIP'
            'cf1cc1de56aa41b88b5030b3589613dc9ae245d32ed3eca2434686ecf06be1ebb6a3682d98e4e10b8587dba507b3d24025606ad3b85920ca6f3855e579dc9367')
b2sums=('ce451810dbd068bbc20d83e8e04e37da674b0801ee11248d1d99f957378d64e645bf594b542b89fac8ad75aae32a473de32bec3c9dc20b1cf307a8577d5e8a96'
        'SKIP'
        'df8b6d4a1e6a9233964cefdeb54d14397764a31f83e3edc6383ed38bc4ad332f9ea4464dbed03151fc29fa4e31a1c7df086091ff26cefa9a3d7f57d368abab9c')
validpgpkeys=('E7729BFFBE85400FEEEE23B178D7DEFB9AD59AF1') # Donald Scott Kitterman <scott@kitterman.com>

prepare() {
  cd $_name-$pkgver
  # embed psddmarc.csv: https://github.com/ValiMail/authentication-headers/issues/4
  cp -v -- ../psddmarc-$_version.csv $_name/psddmarc.csv
  printf 'location = "/usr/share/publicsuffix/public_suffix_list.dat"\n' > $_name/findpsl.py
}

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_name-$pkgver
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="test_dir/$_site_packages:$PYTHONPATH"
  pytest -vv
}

package() {
  cd $_name-$pkgver
  local python_stdlib_basepath="$(python -c "from sysconfig import get_path; print(get_path('stdlib'))")"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 {CHANGES,README.md} -t "$pkgdir/usr/share/doc/$pkgname/"
  install -vDm 644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname/"
}

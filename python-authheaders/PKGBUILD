# Maintainer: David Runge <dvzrv@archlinux.org>

_name=authheaders
pkgname=python-authheaders
pkgver=0.15.3
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
  python-setuptools  # used via pkg_resources
)
makedepends=(
  python-build
  python-installer
  python-wheel
)
checkdepends=(python-pytest)
source=(
  $url/releases/download/$pkgver/$_name-$pkgver.tar.gz{,.asc}
  psddmarc-$_version.csv::https://www.psddmarc.org/psddmarc-participants.csv
)
sha512sums=('e45af947faeb6416160b1b0ee270fb486c3f2d0853ce886e4e66fd57a814838213d73515417f4be25cf3d2e29faa20f183dae7e083aff14bf4c390c0ecddc2f2'
            'SKIP'
            'cf1cc1de56aa41b88b5030b3589613dc9ae245d32ed3eca2434686ecf06be1ebb6a3682d98e4e10b8587dba507b3d24025606ad3b85920ca6f3855e579dc9367')
b2sums=('aca9ff0481c0517d7b2531d7a1860bb6288b094dcceae6bb465c9cde8edb7aa6a14aba4ccf8b7ab7d3e13ada51dd2f7baaff6e4406c0d04c4898c0f9ce234c5b'
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

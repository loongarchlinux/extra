# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: Simon 'ALSimon' Gilliot <simon@gilliot.fr>
# Contributor: Olivier Biesmans <olivier at biesmans dot fr>
# Contributor: Dobroslaw Kijowski

pkgname=mitmproxy
pkgver=10.2.2
pkgrel=1
pkgdesc='SSL-capable man-in-the-middle HTTP proxy'
arch=('any')
url='https://mitmproxy.org'
license=('MIT')
depends=(
  'python'
  'python-aioquic'
  'python-asgiref'
  'python-blinker'
  'python-brotli'
  'python-certifi'
  'python-cryptography'
  'python-flask'
  'python-h11'
  'python-h2'
  'python-hyperframe'
  'python-kaitaistruct'
  'python-ldap3'
  'python-mitmproxy-rs'
  'python-msgpack'
  'python-passlib'
  'python-protobuf'
  'python-psutil'
  'python-publicsuffix2'
  'python-pylsqpack'
  'python-pyopenssl'
  'python-pyparsing'
  'python-pyperclip'
  'python-requests'
  'python-ruamel-yaml'
  'python-sortedcontainers'
  'python-tornado'
  'python-typing_extensions'
  'python-urwid'
  'python-werkzeug'
  'python-wsproto'
  'python-zstandard'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-asynctest'
  'python-hypothesis'
  'python-parver'
  'python-pytest-asyncio'
  'python-pytest-cov'
  'python-pytest-timeout'
)
provides=('pathod')
conflicts=('pathod')
replaces=('pathod')
source=("https://github.com/mitmproxy/mitmproxy/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('04125906ec8b34c9ebb381ac2bdfe5f7bd00db859288e78b4a5e6c79a6a57e6e')
b2sums=('d22b89e69a8fa5afb5975a4adec3ca22a9ba8dd974e4f84dbb6126d4cd203dd35be0ba95a840f8935df55a3dad30966a8cfa7106ba74debff5732f96ac883d83')

build() {
  cd $pkgname-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $pkgname-$pkgver
  python -m installer --destdir=test_dir dist/*.whl

  PATH="test_dir/usr/bin:$PATH" PYTHONPATH="test_dir/$_site_packages:$PYTHONPATH" pytest -vv \
    --deselect test/mitmproxy/proxy/layers/test_tls.py::TestServerTLS::test_remote_speaks_no_tls \
    --deselect test/mitmproxy/proxy/layers/test_tls.py::TestClientTLS::test_mitmproxy_ca_is_untrusted
}

package() {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}

# vim:set ts=2 sw=2 et:

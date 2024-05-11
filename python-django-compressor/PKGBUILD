# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=python-django-compressor
_name="${pkgname#python-}"
pkgver=4.4
pkgrel=2
pkgdesc="Compresses linked and inline javascript or CSS into a single cached file"
arch=(any)
url="https://github.com/django-compressor/django-compressor"
license=(MIT)
depends=(
  python
  python-django
  python-django-appconf
  python-rcssmin
  python-rjsmin
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-beautifulsoup4
  python-brotli
  python-calmjs
  python-csscompressor
  python-django-sekizai
  python-html5lib
  python-jinja
  python-lxml
)
optdepends=(
  'python-beautifulsoup4: for compressor.parser.BeautifulSoupParser and compressor.parser.LxmlParser'
  'python-brotli: for compressor.storage.BrotliCompressorFileStorage'
  'python-calmjs: for compressor.filters.jsmin.CalmjsFilter'
  'python-csscompressor: for compressor.filters.cssmin.CSSCompressorFilter'
  'python-django-sekizai: for including template code into main template'
  'python-html5lib: for compressor.parser.Html5LibParser'
  'python-jinja: for jinja2 templating support'
  'python-lxml: for compressor.parser.LxmlParser'
)
source=(
  $pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz
  $pkgname-4.4-fix_lstrip.patch
  $pkgname-4.4-python-3.12.patch
)
sha512sums=('4fb0fcb1f11d73a724d4d3161b4964f9b4a5bf6ec674d198756ad262d9983528a605aadde6bb10ef2054e477ac08fbc0397242e8969f47d3710bec6f21215086'
            'fcf440e920809bcdc00ce527049c49a5fa0e3c54213aad87b2aee4110f29ed76ab678bf2833bee690c0c72cf89f3de793dda375228be2e4d02b41f267c1a257e'
            '1bbcaac2d6fadf1dd7681c71bcc00c4eb3f4d931b48fe3be46fe70aca552bd933dd554232e21eaea19ddb75277f8199fa957324037249dcb1acbb50b7b8f7a4c')
b2sums=('4f8356318a792c79f78d4e1d4ce9b0cd9dbb9f88f8cc234bec655d6f5d0f9e78da33158405d79bdf1733c845db27d78a19504f7a1a6fb93f4128f4abeb2e9f7e'
        'f380775095d3d0d27ad5699519370ba3bf289969130aa76e949a0c2bc5c353976bbd4b4a8906edbec7be731a10a753f04e9c515fd05bbc9de90e9e2cb5c8e44c'
        '965b9ff89e3e7034ca4472735d8b128489400598d911690171d68bc9f21c19562d78787ae935b349cceec75bc9976da9f5ffd68f9db56c459488a35fde2cf2e2')

prepare() {
  # apply patch for issues with tests that somehow upstream never released because reasons...
  # https://github.com/django-compressor/django-compressor/issues/1237
  patch -Np1 -d $_name-$pkgver -i ../$pkgname-4.4-fix_lstrip.patch
  # fix stuff for python 3.12: https://github.com/django-compressor/django-compressor/pull/1214
  patch -Np1 -d $_name-$pkgver -i ../$pkgname-4.4-python-3.12.patch

  cd $_name-$pkgver
  # we don't support version pinning: https://github.com/django-compressor/django-compressor/issues/1195
  sed -e 's/rcssmin ==/rcssmin >=/;s/rjsmin ==/rjsmin >=/' -i setup.py
}

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_name-$pkgver
  # install to temporary location, as importlib is used
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="test_dir/$_site_packages:$PYTHONPATH"
  cd test_dir/$_site_packages
  django-admin test --settings=compressor.test_settings compressor
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 {AUTHORS,README.rst} -t "$pkgdir/usr/share/doc/$pkgname/"
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

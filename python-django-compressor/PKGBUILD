# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=python-django-compressor
_name="${pkgname#python-}"
pkgver=4.5.1
pkgrel=1
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
)
sha512sums=('c91cb157c1aa879d7b7f0cf8efe575add78c6e7f1edd14e4c7cc434478e9da26d34d35df3227b789ba05b1a46173ae65f67e6e0beb09d3b9fb97b53b82684845')
b2sums=('d8757a8277e0b7b51f687715145723833285ad530617e48d1ca0908164aa75affce49bcb9e659d1253acb556363b0273564161ede51620553e25c99e3853c828')

prepare() {
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

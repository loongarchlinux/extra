# Maintainer: David Runge <dvzrv@archlinux.org>

_name=django_compressor
pkgname=python-django-compressor
pkgver=4.4
pkgrel=1
pkgdesc="Compresses linked and inline javascript or CSS into a single cached file"
arch=(any)
url="https://github.com/django-compressor/django-compressor"
license=(Apache BSD MIT)
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
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha512sums=('54a3443f8900aca89534bb792f6e1d7d46ec9cec81c2bb2e019ea2a0e861845805d187748cc12531209be25c3d9f5dd3cd0f019fb9f439c9b1e7ad2a5785c6c8')
b2sums=('ef6af4228067c66c522c38b54d672d21d275cbad2c11aad419388d57525da6cd2a6a4f3fe8c7e00cc1406926ee05534f71f438ea48275ba7913fd238306e3d7e')

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

# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Andrey Mivrenik <gim at fastmail dot fm>
# Contributor: Tim Diels <tim@timdiels.be>

_name=dropbox-sdk-python
pkgname=python-dropbox
pkgver=11.36.2
pkgrel=1
pkgdesc="Python SDK for Dropbox Core APIs"
url="https://github.com/dropbox/dropbox-sdk-python"
arch=(any)
license=(MIT)
depends=(
  python
  python-requests
  python-setuptools  # for dropbox.session
  python-six
  python-stone
  python-urllib3
)
makedepends=(
  python-build
  python-installer
  python-setuptools-scm
  python-pytest-runner
  python-wheel
)
checkdepends=(
  python-ply
  python-pytest
  python-pytest-mock
)
source=($url/archive/v$pkgver/$_name-v$pkgver.tar.gz)
sha512sums=('ec27685b4e5344e706bffb68b110ef2d7b307a5865bed3e042d6835f3666d2eefca646627a07bae1a3142e5f0346865fe285b037b00f3da081eb5797f9a768f5')
b2sums=('afd0592bd1e18416f91d1fd673f2b7b7f605eaab80c02a9d8535fefa7fb23c8bc6a08c191492e1ced5d4b2d17fa72e8e5b6a58ba797f170c0efb75e755a451c9')

prepare() {
  cd $_name-$pkgver
  # remove strict version dependencies
  # remove broken version specifiers
  sed -e 's/==/>=/;s/2\.\*/2.0/' -i setup.py requirements.txt test/requirements.txt
  # don't use mock
  sed -e 's/import mock/from unittest import mock/' -i test/unit/test_dropbox_unit.py
  # Fix version
  sed -e "s|0.0.0|$pkgver|" -i dropbox/dropbox_client.py
}

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_name-$pkgver
  # install to temporary location, as importlib is used
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="test_dir/$site_packages:$PYTHONPATH"
  pytest -vv --ignore test/integration/
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

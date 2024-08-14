# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Andrey Mivrenik <gim at fastmail dot fm>
# Contributor: Tim Diels <tim@timdiels.be>

_name=dropbox-sdk-python
pkgname=python-dropbox
pkgver=12.0.2
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
  python-wheel
)
checkdepends=(
  python-ply
  python-pytest
  python-pytest-mock
)
source=($url/archive/v$pkgver/$_name-v$pkgver.tar.gz)
sha512sums=('73834c89e2dc8b129a549d082a7862ec81f731c4977c6650cc421c08b62903b78c9fa1e191a330022591e2cb0e29b825e89e2d04056e2f4e6362a168b57fec39')
b2sums=('cc0006909a204f0b9efab7605680027b144dfff5c91ddf31460884ada4948b285ff0777f19f9395a1fc447a906018c3a43b40bc7651bdbb715c597849e7ecba9')

prepare() {
  cd $_name-$pkgver
  # remove strict version dependencies
  # remove broken version specifiers
  sed -e 's/==/>=/;s/2\.\*/2.0/' -i setup.py requirements.txt test/requirements.txt
  # don't use mock
  sed -e 's/import mock/from unittest import mock/' -i test/unit/test_dropbox_unit.py
  # Fix version
  sed -e "s|0.0.0|$pkgver|" -i dropbox/dropbox_client.py
  # Remove pytest-runner
  sed -i 's|pytest-runner|pytest|' setup.py requirements.txt
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

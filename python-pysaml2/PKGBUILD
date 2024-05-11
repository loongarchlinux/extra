# Maintainer: Johannes Löthberg <johannes@kyriasis.com>
# Contributor: Ivan Shapovalov <intelfx@intelfx.name>

_name=pysaml2
pkgname=python-pysaml2
pkgver=7.5.0
pkgrel=2

pkgdesc='Python implementation of SAML Version 2'
url='https://github.com/IdentityPython/pysaml2'
arch=('any')
license=('Apache-2.0')

depends=(
  'python'
  'python-cryptography'
  'python-dateutil'
  'python-defusedxml'
  'python-pyopenssl'
  'python-pytz'
  'python-requests'
  'python-xmlschema'
  'xmlsec'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-poetry-core'
)
checkdepends=(
  'python-pyasn1'
  'python-pymongo'
  'python-pytest'
  'python-responses'
 )
optdepends=(
  'python-paste: for paste integration'
  # 'python-repoze.who: for repoze.who integration'  # TODO: package
  'python-zope-interface: for zope integration'
)
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2b93b50b768711e5ffc96c0b5630c1e50b3160335e267ed902d3a535385e9418')

build() {
  cd $_name-$pkgver
  python -m build --wheel --skip-dependency-check --no-isolation
}

# ImportError: Error importing plugin "junitxml": No module named 'xml.etree'
check() {
  local pytest_options=(
    -vv
  )
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_name-$pkgver
  # install to temporary location, as importlib is used
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="$PWD/test_dir/$site_packages:$PYTHONPATH"
  pytest "${pytest_options[@]}"
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim: set ts=4 sw=4 tw=0 ft=PKGBUILD :

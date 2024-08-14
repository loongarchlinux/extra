# Maintainer: Frederik Schwan <freswa at archlinux dot org>
# Contributor: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor:

pkgname=python-versioningit
pkgver=3.1.2
pkgrel=1
pkgdesc='Versioning It with your Version In Git'
arch=('any')
url='https://github.com/jwodder/versioningit'
license=('MIT')
depends=(
  'python'
  'python-packaging'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'git'
  'mercurial'
  'python-hatchling'
  'python-pydantic'
  'python-pytest'
  'python-pytest-mock'
)
source=("${pkgname#*n-}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${pkgname#*n-}-${pkgver}.tar.gz")
sha256sums=('4db83ed99f56b07d83940bee3445ca46ca120d13b6b304cdb5fb44e5aa4edec0')

build() {
  cd ${pkgname#*n-}-${pkgver}
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    -c /dev/null
    --deselect test/test_end2end.py::test_editable_mode
  )
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd ${pkgname#*n-}-${pkgver}
  # install to temporary location, as importlib is used
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="$PWD/test_dir/$site_packages:$PYTHONPATH"
  pytest "${pytest_options[@]}"
}

package() {
  cd ${pkgname#*n-}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}

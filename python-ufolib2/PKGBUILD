# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Guillaume Horel <guillaume.horel@gmail.com>

_pyname=ufoLib2
pkgname=python-${_pyname,,}
pkgver=0.16.0
pkgrel=2
pkgdesc='A library to deal with UFO font sources'
arch=(any)
url="https://github.com/fonttools/$_pyname"
license=(Apache)
_pydeps=(attrs
         cattrs
         fonttools
         fs # for fonttools[ufo]
         lxml)
depends=(python
         "${_pydeps[@]/#/python-}")
makedepends=(python-{build,installer,wheel}
             python-setuptools-scm) # scm required for _version file generation
checkdepends=(python-msgpack
              python-pytest)
_archive="$_pyname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_archive.tar.gz")
sha256sums=('49f0dc7f72ccacfe7faefe0d53d37971d45664d8b0563ef36956fa7bfa55a2bd')

build() {
	cd "$_archive"
	python -m build -wn
}

check() {
	cd "$_archive"
	PYTHONPATH=src pytest tests --deselect tests/serde/test_json
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}

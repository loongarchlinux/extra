# Maintainer: Thore Bödecker <foxxx0@archlinux.org>
# Contributor: Ian Beringer <ian@ianberinger.com>

pkgname=python-kubernetes
_pkgbase="${pkgname#python-}"
pkgver=28.1.0
pkgrel=3
license=('Apache')
pkgdesc='Python client for the kubernetes API'
arch=('any')
url='https://github.com/kubernetes-client/python'
depends=('python' 'python-certifi' 'python-six' 'python-dateutil'
         'python-urllib3' 'python-yaml' 'python-google-auth'
         'python-websocket-client' 'python-requests' 'python-requests-oauthlib'
         'python-adal')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-pluggy' 'python-py' 'python-isort')
source=("${_pkgbase}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
	"removed-unittest-alias.patch")
sha256sums=('eb03b3b3c586f90323a9aa8ec04bf6691b57abc56af7156030b7bf612c80af17'
            '8fac6ead5125dd8c6644d5bc1696c9581b1a5aeb467254487acf9b8e1146ecd6')

prepare() {
  cd "${srcdir}"

  mv -v "python-${pkgver}" "${_pkgbase}-${pkgver}"

  cd "${srcdir}/${_pkgbase}-${pkgver}"
  patch -Np1 -i $srcdir/removed-unittest-alias.patch
}

build() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  python setup.py build
}

check() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  export PYTHONPATH="${PWD}"
  py.test -vvv -s --ignore=kubernetes/e2e_test
}

package() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

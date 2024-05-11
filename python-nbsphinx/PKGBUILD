# Maintainer: Konstantin Gizdov <arch at kge dot pw>
# Contributor: Liam Timms <timms5000@gmail.com>
# Contributor: Michel Zou

pkgname=python-nbsphinx
pkgver=0.9.3
pkgrel=1
pkgdesc="Jupyter Notebook Tools for Sphinx"
url="http://nbsphinx.rtfd.org/"
arch=(any)
license=('MIT')
depends=('python-docutils' 'python-jinja' 'jupyter-nbconvert' 'jupyter-nbformat' 'python-sphinx')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools-scm')
source=("$pkgname-$pkgver.tar.gz::https://github.com/spatialaudio/nbsphinx/archive/${pkgver}.tar.gz")
b2sums=('60efe03033a0d3f847ae52a2157da23b2021a912fe1f4204cda24e352ace20b39c15172960966ef2e01c5469458c1580e89fb68051cf90bf917bd69fb2fa7425')

build() {
  cd "${srcdir}"/nbsphinx-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/nbsphinx-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

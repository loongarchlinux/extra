# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
pkgname=python-absl
pkgver=2.0.0
pkgrel=1
pkgdesc="Abseil Python Common Libraries"
arch=('any')
url='https://github.com/abseil/abseil-py'
provides=('absl-py')
conflicts=('absl-py')
replaces=('absl-py')
license=('APACHE')
makedepends=(python-{build,installer,wheel} python-setuptools)
source=("https://pypi.io/packages/source/a/absl-py/absl-py-$pkgver.tar.gz")
sha512sums=('42ccf14c4bc695cdefbbd2311d1c86c39362122ec6c7f473a2c6b33568abfffe864b45bf83c018642898eb8d9df3c66718baf8a30a3c33854efcd2bd3f8731c6')

build() {
  cd "$srcdir/absl-py-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/absl-py-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:

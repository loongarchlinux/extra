# Maintainer: David Runge <dvzrv@archlinux.org>

_name=django-mailman3
pkgname=python-django-mailman3
pkgver=1.3.9
_commit=37b1ab762440d66eaf501beedd5c7d0c83e213a7  # refs/tags/1.3.9
pkgrel=3
pkgdesc="Libraries and templates to Django-based interfaces interacting with Mailman"
arch=(any)
url="https://gitlab.com/mailman/django-mailman3"
license=(GPL3)
depends=(python-django python-django-allauth python-django-gravatar
python-mailmanclient python-pytz)
makedepends=(git python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=(git+https://gitlab.com/mailman/django-mailman3#tag=$_commit?signed
	django-4.2-compat.patch)
sha512sums=('SKIP'
            '3cd90f176114e6d8e49bb68fbdd88d69477e3982bb80e65b898e97d277c160a719d37af123907f052bd4119749e71dd93158ffcb44d781a5f824ddfc543884f9')
b2sums=('SKIP'
        '84b5d85e0c6d3a70b64110f289ffc8534054a9af6cf8f5819caa749c58720bab6503bef016e868912c76ac69db03eadff6a78b18216c4a476c3f8eb9440e7513')
validpgpkeys=('541EA0448453394FF77A0ECC9D9B2BA061D0A67C') # Abhilash Raj <raj.abhilash1@gmail.com>

pkgver() {
  cd $_name
  git describe | sed 's/\([^-]*-g\)/r\1/;s/v//g;s/-/./g'
}

prepare() {
  cd $_name
  patch -Np1 -i ${srcdir}/django-4.2-compat.patch
}

build() {
  cd $_name
  python -m build --wheel --no-isolation
}

check() {
  cd $_name
  export PYTHONPATH="build:$PYTHONPATH"
  django-admin test --settings=django_mailman3.tests.settings_test django_mailman3
}

package() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_name
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 README.rst -t "$pkgdir/usr/share/doc/$pkgname"
}

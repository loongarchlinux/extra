# Maintainer: David Runge <dvzrv@archlinux.org>

_name=django-mailman3
pkgname=python-django-mailman3
pkgver=1.3.15
pkgrel=1
pkgdesc="Libraries and templates to Django-based interfaces interacting with Mailman"
arch=(any)
url="https://gitlab.com/mailman/django-mailman3"
license=(GPL-3.0-or-later)
depends=(
  python
  python-django
  python-django-allauth
  python-django-gravatar
  python-mailmanclient
  python-openid
)
makedepends=(
  git
  python-build
  python-installer
  python-pdm-backend
  python-wheel
)
checkdepends=(python-pytest)
source=(
  "git+$url?signed#tag=v$pkgver"
)
sha512sums=('cfe2cbdc254ba089962969f6f57e4c8761ea60ed491930789260e24aff22d864cd41b774c13924df29d295a8ab5d4f929a4c23928cd927ad40054d376882794c')
b2sums=('320812e7d597fa5616305a6d868a75f22819ca2050defa0572eea5ec687cd862628f88a97d27270e594de270e4c385ff69bdcaf00634d455d22c4f1315eee6e5')
validpgpkeys=('541EA0448453394FF77A0ECC9D9B2BA061D0A67C') # Abhilash Raj <raj.abhilash1@gmail.com>

pkgver() {
  cd $_name
  git describe | sed 's/\([^-]*-g\)/r\1/;s/v//g;s/-/./g'
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

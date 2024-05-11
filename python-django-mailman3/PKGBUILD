# Maintainer: David Runge <dvzrv@archlinux.org>

_name=django-mailman3
pkgname=python-django-mailman3
pkgver=1.3.12
pkgrel=2
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
sha512sums=('ab118deb80d5712814dcbbb5744bfa94cff7a15c557bc1833573fc1965b88b846ca4b384c8b6dd2579ac7b8c8d96703a376ea8cdfe7302b096105c17d6c56baa')
b2sums=('8f08d9d51fd7ca686717eeaa7d57043c86fd1351e70013cc129e733e2c8018b671e666ec740a029cbd738c2cce91698502c45c7900777f92435f66c2af4c3e38')
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

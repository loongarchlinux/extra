# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=python-django-gravatar
_name="${pkgname#python-}"
pkgver=1.4.4
pkgrel=7
pkgdesc="Essential Gravatar support for Django"
arch=(any)
url="https://github.com/twaddington/django-gravatar"
license=(MIT)
depends=(
  python
  python-django
)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(python-pytest)
# this commit appears to be effectively 1.4.4: https://github.com/twaddington/django-gravatar/issues/40
_commit=ed123f849b5207e11efdfb1b2b0235baa41df356
source=($pkgname::git+$url.git#commit=$_commit)
sha512sums=('00c8985251e44a05ee34879b8e1cfad2347077b1e31754485abe9d7df49eba87d31dd70b566190dcfe69e3ff6305d27dc290ab48ae1a32636863377c2bf4f90c')

build() {
  cd $pkgname
  python -m build --wheel --no-isolation
}

check() {
  cd $pkgname
  export PYTHONPATH="build:$PYTHONPATH"
  python example_project/manage.py test --verbosity=2 django_gravatar
}

package() {
  cd $pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

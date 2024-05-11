# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-sphinxcontrib-autoprogram
pkgver=0.1.9
_commit=a7cad48b6eddf6a461e3fae91f231dc3e3f2a88f
pkgrel=2
pkgdesc="Documenting CLI programs"
url="https://github.com/sphinx-contrib/autoprogram"
license=('BSD-2-Clause')
arch=('any')
depends=('python-sphinx')
makedepends=('git' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("git+https://github.com/sphinx-contrib/autoprogram.git#commit=$_commit")
sha512sums=('a769ec5e910072d72b607cc976721a2969eac2315ef1b8997b2f6f9dcaf6550ef19b48024fa8ffbc42eb5c2426d21a78e28e64d0fd1466106c7ce3510437aff5')

build() {
  cd autoprogram
  python -m build --wheel --no-isolation
}

check() {
  cd autoprogram
  python -m venv --system-site-packages local-env
  local-env/bin/python -m installer dist/*.whl

  PYTHONPATH="$PWD"/doc local-env/bin/python -m unittest sphinxcontrib.autoprogram.suite -v
}

package() {
  cd autoprogram
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}

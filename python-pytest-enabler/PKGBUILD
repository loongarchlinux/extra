# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-pytest-enabler
pkgver=3.1.1
pkgrel=2
pkgdesc='Enable installed pytest plugins'
arch=('any')
license=('MIT')
url='https://github.com/jaraco/pytest-enabler'
depends=('python-jaraco.context' 'python-jaraco.functools' 'python-pytest' 'python-toml')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools-scm' 'python-wheel')
checkdepends=('python-pytest-mypy' 'python-pytest-ruff' 'python-pytest-cov')
source=("git+https://github.com/jaraco/pytest-enabler.git#tag=v$pkgver"
        "https://files.pythonhosted.org/packages/source/t/types-toml/types-toml-0.10.1.tar.gz")
sha512sums=('3e820dbc71cc8f76bd295939067a53ca23894a81cc484b007cb63471cb33ab4887a35fbc391bd55fa05d6f4fc5be12989604eeda231a5b9a094b326628460470'
            '001757f956dd3af0688a6544b90ba415b26ab3128e0fbb238f4dfaf0bab6b5795d5598bcc9422d854ea235acbc9e78b245c17f9ebc9ad9251ae3c0722b382812')

prepare() {
  cd pytest-enabler
  # mypy needs all type stubs :/
  ln -s ../types-toml-0.10.1/toml-stubs .
}

build() {
  cd pytest-enabler
  python -m build --wheel --no-isolation
}

check() {
  cd pytest-enabler
  PYTHONPATH="$PWD" pytest
}

package() {
  cd pytest-enabler
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}

# vim:set ts=2 sw=2 et:

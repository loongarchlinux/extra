# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-tldextract
pkgver=5.1.1
_commit=c0867a4ef26bd39d58c08c52af797f2dca8bb5a9
pkgrel=1
pkgdesc="Accurately separate the TLD from the registered domain and subdomains of a URL, using the Public Suffix List"
arch=('any')
url="https://github.com/john-kurkowski/tldextract"
license=('BSD')
depends=('python-idna' 'python-requests' 'python-requests-file' 'python-filelock')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-setuptools-scm'
             'python-wheel')
checkdepends=('python-pytest' 'python-pytest-mock' 'python-pytest-pylint' 'python-responses'
              'python-isort')
source=("git+https://github.com/john-kurkowski/tldextract.git#commit=$_commit")
sha512sums=('SKIP')

build() {
  cd tldextract
  python -m build -nw
}

check() {
  cd tldextract
  python -m pytest
}

package() {
  cd tldextract
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}

# vim:set sw=2 et:

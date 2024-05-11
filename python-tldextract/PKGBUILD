# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-tldextract
pkgver=5.1.2
pkgrel=3
pkgdesc="Accurately separate the TLD from the registered domain and subdomains of a URL, using the Public Suffix List"
arch=('any')
url="https://github.com/john-kurkowski/tldextract"
license=('BSD-3-Clause')
depends=('python-idna' 'python-requests' 'python-requests-file' 'python-filelock')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-setuptools-scm'
             'python-wheel')
checkdepends=('python-pytest' 'python-pytest-mock' 'python-responses'
              'python-isort' 'python-syrupy')
source=("git+https://github.com/john-kurkowski/tldextract.git#tag=$pkgver")
sha512sums=('b44ca708da11f70c771ca10d5f901d3187dc2c5505f0e42a264c4614baa2b6328d8356d0353e0826f8a4245ebf95f8573673c8b1ef2cc5775756898a2dd6661b')

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

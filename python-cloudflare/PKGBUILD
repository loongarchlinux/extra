# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-cloudflare
pkgver=2.11.7
pkgrel=2
pkgdesc='Python wrapper for the Cloudflare v4 API'
arch=('any')
license=('MIT')
url='https://github.com/cloudflare/python-cloudflare'
depends=('python-requests' 'python-future' 'python-yaml' 'python-jsonlines' 'python-beautifulsoup4')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("https://github.com/cloudflare/python-cloudflare/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('21c474b0465aab19498095e28937aebbc428d5aa70480f7deb5ef1fe74340bfdd7580b66be34eee1f1fc5c2b5f3e2d0666704d3fdda96a69ca139516e60c9a95')

build() {
  cd python-cloudflare-$pkgver
  python setup.py build
}

check() {
  cd python-cloudflare-$pkgver
  PYTHONPATH="$PWD/build/lib" pytest tests/test1.py
}

package() {
  cd python-cloudflare-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/

  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  rm -r "$pkgdir$site_packages"/examples
}

# vim:set ts=2 sw=2 et:

# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>

pkgname=python-email-validator
pkgver=2.1.0
pkgrel=1
pkgdesc="A robust email address syntax and deliverability validation library"
arch=('any')
url="https://github.com/JoshData/python-email-validator"
license=('custom:CC0')
depends=('python-dnspython' 'python-idna')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::https://github.com/JoshData/python-email-validator/archive/v$pkgver.tar.gz")
sha512sums=('d285404f6735e0cd33385060c483a4dd4e12ace4b2e7027f8cd360901bc640ae999eb5d3ec2b98530e53af48f8e6c180d65cb53eec4de5a1617149ab76027901')

build() {
  cd python-email-validator-$pkgver
  python setup.py build
}

check() {
  cd python-email-validator-$pkgver
  python -m pytest
}

package() {
  cd python-email-validator-$pkgver
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}

# vim:set ts=2 sw=2 et:

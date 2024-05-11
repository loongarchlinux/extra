# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-praw
pkgver=7.7.1
pkgrel=3
pkgdesc="Python Reddit API Wrapper that allows for simple access to Reddit's API"
arch=('any')
license=('BSD-2-Clause')
url="https://praw.readthedocs.org"
depends=('python-prawcore' 'python-update-checker' 'python-websocket-client')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-betamax-serializers' 'python-betamax-matchers' 'python-pytest')
source=("$pkgname-$pkgver.tar.gz::https://github.com/praw-dev/praw/archive/v$pkgver.tar.gz")
sha512sums=('543b342e2ea372f5b5f13c151c9222b69f56c94067a778bccc75c42a58aa88745888c33ca504521832fea76819a96c76a18b96ea17cf53b26152e9c3caf44c57')

build() {
  cd praw-$pkgver
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd praw-$pkgver
  pytest
}

package() {
  cd praw-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}

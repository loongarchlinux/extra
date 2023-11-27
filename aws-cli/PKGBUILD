# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Chris Severance aur.severach AatT spamgourmet.com
# Contributor: Alper KANAT <alperkanat@raptiye.org>

pkgname=aws-cli
# UPDATE_BLOCKED: blocked as python-botocore is blocked
pkgver=1.29.64
pkgrel=1
pkgdesc='Universal Command Line Interface for Amazon Web Services'
arch=('any')
url="https://github.com/aws/aws-cli"
license=('Apache')
# Upstream relies on transitive dependencies https://github.com/aws/aws-cli/issues/6556
depends=('python' 'python-botocore' 'python-dateutil' 'python-jmespath'
         'python-colorama' 'python-docutils' 'python-pyasn1' 'python-rsa'
         'python-s3transfer' 'python-yaml')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
md5sums=('7d9826c9f61b99963d3a131e3469d057')
sha256sums=('2a119034d4b0ba1e5cbc8a0846e1c2fa446cdbf6a6cb17373d5ce8a4c74df26c')

build() {
  cd $pkgname-$pkgver

  python -m build --wheel --no-isolation
}

package() {
  cd $pkgname-$pkgver

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -Dm644 bin/aws_bash_completer "$pkgdir"/usr/share/bash-completion/completions/aws

  rm -f "$pkgdir"/usr/bin/{aws.cmd,aws_bash_completer}
}

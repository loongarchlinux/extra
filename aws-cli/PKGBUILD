# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Chris Severance aur.severach AatT spamgourmet.com
# Contributor: Alper KANAT <alperkanat@raptiye.org>

pkgname=aws-cli
# UPDATE_BLOCKED: blocked as python-botocore is blocked
pkgver=1.27.162
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
md5sums=('666e3d1e5a64c7f1c2e530f37442f205')
sha256sums=('bf4e810cc2b6193454b7c1706d5aa2234c15b19b88300ab45ea56cd633f8466d')

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

# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Chris Severance aur.severach AatT spamgourmet.com
# Contributor: Alper KANAT <alperkanat@raptiye.org>

pkgname=aws-cli
pkgver=1.32.69
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
checkdepends=('python-pytest' 'python-pytest-xdist' 'python-awscrt')
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
md5sums=('13adb4ec61cf4670e3e9dbe1a3aa33a4')
sha256sums=('3671b562e5166ee18038e6800a4750ce7dd802a0bddb13cab30f09ee5c407f1c')

build() {
  cd $pkgname-$pkgver

  python -m build --wheel --no-isolation
}

check() {
  cd $pkgname-$pkgver

  # Install to a temporary location, as some tests need the 'aws' command
  python -m installer --destdir="$PWD/tmp_install" dist/*.whl

  export PYTHONPATH="$PWD"
  export PATH="$PATH:$PWD/tmp_install/usr/bin"

  export PYTEST_XDIST_AUTO_NUM_WORKERS=$(echo "$MAKEFLAGS" | grep -oP '\-j\s*\K[0-9]+')
  pytest_args=()
  if [ -n "$PYTEST_XDIST_AUTO_NUM_WORKERS" ]; then
    pytest_args+=(-n auto)
  fi

  # Many integration tests need real credentials
  pytest tests "${pytest_args[@]}" --ignore=tests/integration
}

package() {
  cd $pkgname-$pkgver

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -Dm644 bin/aws_bash_completer "$pkgdir"/usr/share/bash-completion/completions/aws

  rm -f "$pkgdir"/usr/bin/{aws.cmd,aws_bash_completer}
}

# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Brett Cornwall <ainola@archlinux.org>

pkgname=tldr
pkgver=3.3.0
pkgrel=1
pkgdesc="Command line client for tldr, a collection of simplified man pages."
arch=('any')
url="https://github.com/tldr-pages/tldr-python-client"
license=('MIT')
depends=('python-shtab' 'python-colorama' 'python-termcolor')
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'  # Set in pyproject.toml build
    'python-sphinx-argparse'
    'python-wheel'
)
checkdepends=('python-pytest')
source=("https://github.com/tldr-pages/tldr-python-client/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('137560c401540ff1e747f443a3c0686ddba8c512772eadbff6b735aa9c20dd02a9c7b101b2238888daa20b2886dc4318bc7c1366d8b73f71dd2f797b1787b632')

build() {
  cd "tldr-python-client-$pkgver"
  make -C docs
  python -m build --wheel --no-isolation
}

check() {
  cd tldr-python-client-$pkgver
  python -m pytest
}

package() {
  cd "tldr-python-client-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname/"

  # Generate here instead of a .install for package reproducibility
  install -dm755 "$pkgdir/usr/share/bash-completion/completions/"
  install -dm755 "$pkgdir/usr/share/zsh/site-functions/"
  python "$pkgdir"/usr/lib/python*/site-packages/tldr.py --print-completion bash \
    > "$pkgdir/usr/share/bash-completion/completions/tldr"
  python "$pkgdir"/usr/lib/python*/site-packages/tldr.py --print-completion zsh \
    > "$pkgdir/usr/share/zsh/site-functions/_tldr"
}

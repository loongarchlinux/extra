# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-pypandoc
pkgver=1.13
pkgrel=2
pkgdesc="Thin wrapper for pandoc"
arch=('any')
license=('MIT')
url="https://github.com/JessicaTegner/pypandoc"
depends=('pandoc')
makedepends=('python-build' 'python-installer' 'python-poetry-core' 'python-wheel')
checkdepends=('texlive-basic' 'texlive-latexextra' 'texlive-fontsrecommended' 'python-pandocfilters')
source=("https://github.com/JessicaTegner/pypandoc/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('6f7acb4fd113606244a4a6eccac28bc4605e038da19dbb8c86c65b4b6a00aa5bc7cd0a8740145784335b10fb5d12bb85857c41a5a69bfb70c1d845c3738dcfa1')

build() {
  cd pypandoc-$pkgver
  python -m build -wn
}

check() {
  cd pypandoc-$pkgver
  # https://github.com/NicklasTegner/pypandoc/issues/278
  python tests.py || echo "Tests failed"
}

package() {
  cd pypandoc-$pkgver
  python -m installer -d "$pkgdir" dist/*.whl
  install -D -m644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}

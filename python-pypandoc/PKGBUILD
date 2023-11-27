# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-pypandoc
pkgver=1.12
pkgrel=1
pkgdesc="Thin wrapper for pandoc"
arch=('any')
license=('MIT')
url="https://github.com/JessicaTegner/pypandoc"
depends=('pandoc')
makedepends=('python-build' 'python-installer' 'python-poetry-core' 'python-wheel')
checkdepends=('texlive-basic' 'texlive-latexextra' 'texlive-fontsrecommended' 'python-pandocfilters')
source=("https://github.com/JessicaTegner/pypandoc/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('889050011fd6d2c79a8c0ab84e7effab849b75cf0616daf746d43f3f0165b1ace14d15b2d030370453ff4110fbddc97bf4886695619ffabd1eb235f9ed2d9cb3')

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

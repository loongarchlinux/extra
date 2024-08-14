# Maintainer: Morten Linderud <foxboron@archlinux.org>
# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Pierre Neidhardt <ambrevar@gmail.com>
# Contributor: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>

pkgname=qutebrowser
pkgver=3.2.1
pkgrel=1
pkgdesc="A keyboard-driven, vim-like browser based on Python and Qt"
arch=("any")
url="https://www.qutebrowser.org/"
license=("GPL")
depends=("python-jinja" "python-pyqt6" "python-yaml" "qt6-base" "python-pyqt6-webengine")
makedepends=("asciidoc" "python-setuptools")
optdepends=("python-adblock: adblocking backend"
            "python-pygments"
            "pdfjs: displaying PDF in-browser")
options=(!emptydirs)
source=("https://github.com/qutebrowser/qutebrowser/releases/download/v$pkgver/qutebrowser-$pkgver.tar.gz"
        "https://github.com/qutebrowser/qutebrowser/releases/download/v$pkgver/qutebrowser-$pkgver.tar.gz.asc")
validpgpkeys=("27F3BB4FC217EECB858578AEEF7EE4D039690B7B")
sha256sums=('02a7af2a6c5db38d87b225b0b8412c80d9838335f32d0e8a38f6d7fbcd38897d'
            'SKIP')

build() {
    cd "$pkgname-$pkgver"
    make -f misc/Makefile all
}

package() {
    cd "$pkgname-$pkgver"
    make -f misc/Makefile DESTDIR="$pkgdir" PREFIX=/usr install
}

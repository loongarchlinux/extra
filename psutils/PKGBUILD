# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: eric <eric@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
 
pkgname=psutils
_pyname=pspdfutils
pkgver=3.3.4
pkgrel=1
pkgdesc='A set of postscript utilities'
arch=(any)
url="https://github.com/rrthomas/$pkgname"
license=(GPL-3.0-only)
depends=(libpaper
         python
         python-puremagic
         python-pypdf)
makedepends=(python-{build,installer,wheel}
             python-argparse-manpage
             python-setuptools)
checkdepends=(ghostscript
              python-pytest-datafiles
              python-wand)
# provides=("python-$_pyname=$pkgver")
_archive="$_pyname-$pkgver"
source=("$url/releases/download/v$pkgver/$_archive.tar.gz")
sha256sums=('94b331826967d04b9d055c8a8e2a374c5824fd120d49c24b73d16644127d51fe')

prepare() {
	cd "$_archive"
	# unpin too-aggressive dependency pinning by just removing them,
	# we're providing them anyway
	sed -i \
		-e '/pytest-datafiles/d' \
		-e '/Wand/d' \
		pyproject.toml
}

build() {
	cd "$_archive"
	python -m build -wn
}

check() {
	cd "$_archive"
	export PYTHONPATH="."
	pytest
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" COPYING
}

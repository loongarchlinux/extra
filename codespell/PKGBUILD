# Maintainer: Anatol Pomozov
# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=codespell
pkgver=2.3.0
pkgrel=1
pkgdesc='check code for common misspellings'
arch=('any')
url='https://github.com/codespell-project/codespell'
license=('GPL-2.0-only')
depends=('python-chardet')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools-scm')
checkdepends=('python-pytest-cov' 'python-pytest-dependency')
source=("https://pypi.io/packages/source/c/codespell/${pkgname}-${pkgver}.tar.gz"
	"remove-check-test_command.patch")
sha256sums=('360c7d10f75e65f67bad720af7007e1060a5d395670ec11a7ed1fed9dd17471f'
            '17a5390c0123480c794d293e0a6b95a9f941ea9d5d9168649746dd55faf0b833')

prepare() {
	cd "${pkgname}-${pkgver}"

	# Remove the "test_command" check which makes check() fail
	patch -Np1 < "${srcdir}/remove-check-test_command.patch"
}

build() {
	cd "${pkgname}-${pkgver}"
	python -m build --wheel --no-isolation
}

check() {
	cd "${pkgname}-${pkgver}"

	# Tests now want to run codespell: https://github.com/codespell-project/codespell/issues/3433
	# Below is my attempt at installing codespell in a temporary location for the tests
	# The `codespell` command works (in the sense that it is correctly added to $PATH with python modules correctly imported)
	# But tests are still failing with "E   FileNotFoundError: [Errno 2] No such file or directory: 'codespell'" regardless
	# I'm disabling tests for now while waiting for an upstream fix (or a downstream workaround)

	#python -m installer --destdir="test_dir" dist/*.whl
	#export PATH="test_dir/usr/bin/:${PATH}"
	#export PYTHONPATH="test_dir/$site_packages:$PYTHONPATH"
	#pytest
}

package() {
	cd "${pkgname}-${pkgver}"
	python -m installer --destdir="${pkgdir}" dist/*.whl

	install -Dm 644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
}

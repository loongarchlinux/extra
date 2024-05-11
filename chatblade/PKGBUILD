# Maintainer: hashworks <hashworks@archlinux.org>

pkgname=chatblade
pkgdesc="A CLI Swiss Army Knife for ChatGPT"
pkgver=0.4.0
pkgrel=2
arch=("any")
url="https://github.com/npiv/chatblade"
license=("GPL-3.0-only")
# https://github.com/npiv/chatblade/blob/main/requirements.txt
depends=(
	"python"
	"python-aiohttp"
	"python-aiosignal"
	"python-async-timeout"
	"python-attrs"
	"python-certifi"
	"python-charset-normalizer"
	"python-frozenlist"
	"python-idna"
	"python-markdown-it-py"
	"python-mdurl"
	"python-multidict"
	"python-openai"
	"python-pygments"
	"python-yaml"
	"python-regex"
	"python-requests"
	"python-rich"
	"python-tiktoken"
	"python-tqdm"
	"python-urllib3"
	"python-yarl"
	"python-setuptools"
)
makedepends=(
	"python-build"
	"python-wheel"
	"python-installer"
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('faeff1332f718d7213fd35ed43bac056cf520f9aff7374a20dd6c39b213a1fc4')

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	# Use remote assets
	sed -i 's#<img src="assets/\([^"]*\)">#<img src="'${url}'/raw/v'${pkgver}'/assets/\1">#g' README.md
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	python -m installer --destdir="${pkgdir}" dist/*.whl
}

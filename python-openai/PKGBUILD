# Maintainer: Justin Kromlinger <hashworks@archlinux.org>
# Contributor: Liam Timms <timms5000@gmail.com>
# Contributor: Mark Wagie <mark dot wagie at proton dot me>

pkgname=python-openai
_name=openai-python
pkgver=1.3.5
pkgrel=1
pkgdesc="Python client library for the OpenAI API"
arch=('any')
url="https://github.com/openai/openai-python"
license=('MIT')
depends=('python-anyio' 'python-httpx' 'python-tqdm' 'python-h2' 'python-distro' 'python-typing_extensions' 'python-pydantic')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel' 'python-hatchling')
#checkdepends=('python-pytest' 'python-pytest-asyncio')
optdepends=('python-numpy: Needed for CLI fine-tuning data preparation tool'
            'python-pandas: Needed for CLI fine-tuning data preparation tool'
            'python-pandas-stubs: Needed for type hints for mypy'
            'python-openpyxl: Needed for CLI fine-tuning data preparation tool xlsx format'
            'python-wandb: Support for Weights & Biases'
            'python-scikit-learn: Needed for embedding utils'
            'python-tenacity: embeddings'
            'python-matplotlib: embeddings'
            'python-plotly: embeddings'
            'python-scipy: embeddings')
source=("${_name}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('6555b60bfde077553a01440f06822523ed3872c04af9663d6d924ffc1855f55f')

build() {
  cd "${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

# Needs AUR check deps
#check() {
#  cd "${_name}-${pkgver}"
#  python -m pytest
#}

package() {
  cd "${_name}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}


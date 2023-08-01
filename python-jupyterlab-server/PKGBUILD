# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Guillaume Duboc <guilduboc@gmail.com>

_pipname=jupyterlab_server
pkgname=python-${_pipname/_/-}
pkgver=2.24.0
pkgrel=1
pkgdesc='Launch an application built using JupyterLab'
arch=(any)
url='https://jupyter.org/'
license=(custom)
depends=(jupyter-server python-requests python-json5 python-babel python-ruamel-yaml)
makedepends=(python-build python-installer python-hatchling)
checkdepends=(python-pytest-tornasync python-pytest-cov python-pytest-timeout python-pytest-jupyter
              python-openapi-core python-strict-rfc3339 python-parse python-requests-mock
              python-jupyter-server-terminals)
conflicts=(jupyterlab_server python-jupyterlab_server)
provides=(python-jupyterlab_server)
replaces=(jupyterlab_server python-jupyterlab_server)
source=(https://pypi.io/packages/source/j/$_pipname/$_pipname-$pkgver.tar.gz)
sha256sums=('4e6f99e0a5579bbbc32e449c4dbb039561d4f1a7827d5733273ed56738f21f07')

build() {
  cd $_pipname-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_pipname-$pkgver
# Skip tests that fail with openapi-core>=0.17
  pytest -v -W ignore::DeprecationWarning -k 'not test_translation_api.py and not test_listings_api.py and not test_settings_api.py and not test_themes_api.py and not test_workspaces_api.py and not test_page_config'
}

package() {
  cd $_pipname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}

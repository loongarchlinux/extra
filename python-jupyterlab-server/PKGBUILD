# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Guillaume Duboc <guilduboc@gmail.com>

_pyname=jupyterlab_server
pkgname=python-${_pyname/_/-}
pkgver=2.25.2
pkgrel=1
pkgdesc='Launch an application built using JupyterLab'
arch=(any)
url='https://jupyter.org/'
license=(custom)
depends=(jupyter-server
         python
         python-babel
         python-importlib-metadata
         python-json5
         python-jsonschema
         python-jupyter-core
         python-packaging
         python-requests
         python-ruamel-yaml
         python-tornado
         python-traitlets)
makedepends=(python-build
             python-hatchling
             python-installer)
checkdepends=(python-jupyter-server-terminals
              python-openapi-core
              python-parse
              python-pytest
              python-pytest-cov
              python-pytest-jupyter
              python-pytest-timeout
              python-pytest-tornasync
              python-requests-mock
              python-strict-rfc3339)
conflicts=(jupyterlab_server
           python-jupyterlab_server)
provides=(python-jupyterlab_server)
replaces=(jupyterlab_server
          python-jupyterlab_server)
source=(https://github.com/jupyterlab/jupyterlab_server/releases/download/v$pkgver/$_pyname-$pkgver.tar.gz)
sha256sums=('bd0ec7a99ebcedc8bcff939ef86e52c378e44c2707e053fcd81d046ce979ee63')

build() {
  cd $_pyname-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_pyname-$pkgver
# Skip tests that fail with openapi-core>=0.17
  pytest -v -W ignore::DeprecationWarning -k 'not test_translation_api.py and not test_listings_api.py and not test_settings_api.py and not test_themes_api.py and not test_workspaces_api.py and not test_page_config'
}

package() {
  cd $_pyname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}

# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=jupyter-server
pkgver=2.11.0
pkgrel=1
pkgdesc='Provides the backend for Jupyter web applications like Jupyter notebook, JupyterLab, and Voila'
arch=(any)
url='https://jupyter.org/'
license=(custom)
depends=(jupyter-nbconvert
         jupyter-nbformat
         python
         python-anyio
         python-argon2_cffi
         python-jinja
         python-jupyter-client
         python-jupyter-core
         python-jupyter-events
         python-overrides
         python-packaging
         python-prometheus_client
         python-send2trash
         python-tornado
         python-traitlets
         python-websocket-client)
makedepends=(python-build
             python-hatch-jupyter-builder
             python-installer)
checkdepends=(python-flaky
              python-jupyter-server-terminals
              python-pytest
              python-pytest-console-scripts
              python-pytest-jupyter
              python-pytest-timeout
              python-pytest-tornasync
              python-requests
              python-terminado)
optdepends=('jupyter-server-mathjax: to use local MathJax'
            'python-jupyter-server-terminals: terminals support')
source=(https://github.com/jupyter-server/${pkgname/-/_}/releases/download/v$pkgver/${pkgname/-/_}-$pkgver.tar.gz)
sha256sums=('78c97ec8049f9062f0151725bc8a1364dfed716646a66819095e0e8a24793eba')

prepare() {
  cd ${pkgname/-/_}-$pkgver
  sed -e '/jupyter_server_terminals/d' -i pyproject.toml # Prevent cyclic dependencies
}

build() {
  cd ${pkgname/-/_}-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd ${pkgname/-/_}-$pkgver
# Skip tests that fail on the build server
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest -v -k 'not test_api.py and not test_authorized_requests and not test_delete_non_empty_folder'
}

package() {
  cd ${pkgname/-/_}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}

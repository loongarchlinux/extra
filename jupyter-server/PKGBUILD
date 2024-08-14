# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=jupyter-server
pkgver=2.14.2
pkgrel=1
pkgdesc='Provides the backend for Jupyter web applications like Jupyter notebook, JupyterLab, and Voila'
arch=(any)
url='https://jupyter.org/'
license=(BSD-3-Clause)
depends=(jupyter-nbconvert
         jupyter-nbformat
         python
         python-anyio
         python-argon2_cffi
         python-colorama
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
makedepends=(git
             npm
             python-build
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
source=(git+https://github.com/jupyter-server/jupyter_server#tag=v$pkgver)
sha256sums=('6b3872722970ed0f554d3a530c94e0410290eb9f4e47c49b64609ec4ffad812c')

prepare() {
  cd ${pkgname/-/_}
  sed -e '/jupyter_server_terminals/d' -i pyproject.toml # Prevent cyclic dependencies
}

build() {
  cd ${pkgname/-/_}
  python -m build --wheel --no-isolation
}

check() {
  cd ${pkgname/-/_}
# Testing is useless, most tests fail on the build server
#  python -m venv --system-site-packages test-env
#  test-env/bin/python -m installer dist/*.whl
#  test-env/bin/python -m pytest -v
}

package() {
  cd ${pkgname/-/_}
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}

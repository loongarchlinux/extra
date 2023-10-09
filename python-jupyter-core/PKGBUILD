# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Kyle Keen <keenerd@gmail.com>

_pyname=jupyter_core
pkgname=python-${_pyname/_/-}
pkgver=5.3.2
pkgrel=1
pkgdesc='Jupyter core package. A base package on which Jupyter projects rely'
arch=(any)
url='https://pypi.python.org/pypi/jupyter_core'
license=(BSD)
depends=(python
         python-argcomplete
         python-traitlets
         python-platformdirs)
makedepends=(python-build
             python-hatchling
             python-installer)
checkdepends=(python-pip
              python-pytest)
conflicts=(python-jupyter_core)
provides=(python-jupyter_core)
replaces=(python-jupyter_core)
source=(https://files.pythonhosted.org/packages/source/j/jupyter_core/$_pyname-$pkgver.tar.gz)
sha256sums=('0c28db6cbe2c37b5b398e1a1a5b22f84fd64cd10afc1f6c05b02fb09481ba45f')

prepare() {
  cd $_pyname-$pkgver
  sed -e '/\/usr\/local\/share\/jupyter/d' -i jupyter_core/paths.py
}

build() {
  cd $_pyname-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_pyname-$pkgver
  pytest -v \
    --deselect tests/test_command.py::test_not_on_path \
    --deselect tests/test_command.py::test_path_priority \
    --deselect tests/test_command.py::test_argv0 \
    --deselect tests/test_paths.py::test_jupyter_path_prefer_env # https://github.com/jupyter/jupyter_core/issues/208
}

package() {
  cd $_pyname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
  install -Dm644 examples/jupyter-completion.bash "$pkgdir"/usr/share/bash-completion/completions/jupyter
  install -Dm644 examples/completions-zsh "$pkgdir"/usr/share/zsh/site-functions/_jupyter
}

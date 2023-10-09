# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Kyle Keen <keenerd@gmail.com>

pkgname=jupyter-nbconvert
_name=nbconvert
pkgver=7.9.2
pkgrel=1
pkgdesc='Jupyter Notebook Conversion'
arch=(any)
url='https://pypi.python.org/pypi/nbconvert'
license=(BSD)
depends=(ipython
         jupyter-nbclient
         jupyter-nbformat
         jupyterlab-pygments
         python
         python-beautifulsoup4
         python-bleach
         python-defusedxml
         python-importlib-metadata
         python-jinja
         python-jupyter-client
         python-jupyter-core
         python-markupsafe
         python-mistune
         python-packaging
         python-pandocfilters
         python-pygments
         python-tinycss2
         python-tornado
         python-traitlets)
makedepends=(python-build
             python-hatchling
             python-installer)
checkdepends=(python-flaky
              python-ipywidgets
              python-pyppeteer
              python-pytest)
optdepends=('pandoc: non-html conversion output'
            'python-pyppeteer: for webPDF conversion support')
source=(https://github.com/jupyter/nbconvert/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('2566227ce9f15df760bd0a5206d63123634ef3b3feeed37dd7776b6ed2ff2b03')

build() {
  cd nbconvert-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd nbconvert-$pkgver
  python -m venv --system-site-packages test-env
  test-env/bin/python -m pip install -e .
  # disable tests that download chromium and (probably) require a graphical session
  test-env/bin/python -m pytest -v -k 'TestWebPDFExporter and not (test_export or test_webpdf_without_pyppeteer)' -W ignore::DeprecationWarning
  test-env/bin/python -m pytest -v -k 'TestNbConvertApp and not test_webpdf_with_chromium' -W ignore::DeprecationWarning
  # run all remaining tests
  test-env/bin/python -m pytest -v -k 'not TestWebPDFExporter and not TestNbConvertApp' -W ignore::DeprecationWarning
}

package() {
  cd nbconvert-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}

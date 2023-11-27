# Maintainer: Antonio Rojas <arojas@archlinux.org>

_pyname=openapi-core
pkgname=python-$_pyname
pkgver=0.18.2
pkgrel=2
pkgdesc='Client-side and server-side support for the OpenAPI Specification v3'
arch=(any)
url='https://github.com/p1c2u/openapi-core'
license=(BSD)
depends=(python
         python-asgiref
         python-isodate
         python-jsonschema
         python-jsonschema-spec
         python-more-itertools
         python-openapi-schema-validator
         python-openapi-spec-validator
         python-parse
         python-werkzeug)
makedepends=(python-build
             python-installer
             python-poetry-core)
optdepends=(python-aiohttp
            python-django
            python-falcon
            python-flask
            python-multidict
            python-requests
            python-starlette)
checkdepends=(python-pytest
              python-pytest-aiohttp
              python-pytest-asyncio  # a dependency of python-pytest-aiohttp
              python-aiohttp
              python-django
              python-django-rest-framework
              python-falcon
              python-flask
              python-httpx
              python-multidict
              python-requests
              python-responses
              python-starlette)
source=(https://github.com/python-openapi/openapi-core/archive/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('406e231f28c734e76b8f184799e1db04f662848d803f9df4b89e9c0ef07dfbb9')

prepare() {
  cd $_pyname-$pkgver
  sed -i 's/--cov\S*//' pyproject.toml
}

build() {
  cd $_pyname-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_pyname-$pkgver
  PYTHONPATH="$PWD" pytest -v
}

package() {
  cd $_pyname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}

# Maintainer: Antonio Rojas <arojas@archlinux.org>

_pyname=openapi-core
pkgname=python-$_pyname
pkgver=0.19.2
pkgrel=2
pkgdesc='Client-side and server-side support for the OpenAPI Specification v3'
arch=(any)
url='https://github.com/p1c2u/openapi-core'
license=(BSD)
depends=(python
         python-asgiref
         python-isodate
         python-jsonschema
         python-jsonschema-path
         python-more-itertools
         python-openapi-schema-validator
         python-openapi-spec-validator
         python-parse
         python-werkzeug)
makedepends=(git
             python-build
             python-installer
             python-poetry-core)
optdepends=(python-aiohttp
            python-aioitertools
            python-django
            python-falcon
            python-fastapi
            python-flask
            python-multidict
            python-requests
            python-starlette)
checkdepends=(python-pytest
              python-pytest-aiohttp
              python-pytest-asyncio  # a dependency of python-pytest-aiohttp
              python-aiohttp
              python-aioitertools
              python-django
              python-django-rest-framework
              python-falcon
              python-fastapi
              python-flask
              python-httpx
              python-multidict
              python-requests
              python-responses
              python-starlette)
source=(git+https://github.com/python-openapi/openapi-core#tag=$pkgver)
sha256sums=('93c10d714e240f677745a7b546aff6971f51b732504c7e0ca136aa56b18a0cfe')

prepare() {
  cd $_pyname
  sed -i 's/--cov\S*//' pyproject.toml
}

build() {
  cd $_pyname
  python -m build --wheel --no-isolation
}

check() {
  cd $_pyname
  PYTHONPATH="$PWD" pytest -v
}

package() {
  cd $_pyname
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}

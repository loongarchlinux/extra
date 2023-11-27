# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_name=fastapi
pkgname=python-$_name
pkgver=0.104.1
pkgrel=1
pkgdesc='FastAPI framework, high performance, easy to learn, fast to code, ready for production'
arch=(any)
url="https://github.com/tiangolo/fastapi"
license=(MIT)
depends=(
  python
  python-anyio  # implicitly required for concurrency
  python-dirty-equals
  python-pydantic
  python-pydantic-core
  python-pydantic-extra-types
  python-pydantic-settings
  python-starlette
  python-typing-extensions
)
makedepends=(
  python-build
  python-installer
  python-hatchling
  python-wheel
)
checkdepends=(
  # test dependencies
  python-aiosqlite
  python-anyio
  python-databases
  python-flask
  python-httpx
  python-peewee
  python-pytest
  python-sqlalchemy
  python-trio

  # optdepends
  python-email-validator
  python-itsdangerous
  python-jinja
  python-orjson
  python-python-multipart
  python-pyyaml
  python-ujson
  uvicorn

  # dev depends
  python-bcrypt
  python-cryptography
  python-jose
  python-passlib
)
optdepends=(
  'hypercorn: for Hypercorn as ASGI server'
  'python-email-validator: for email validation'
  'python-itsdangerous: for SessionMiddleware support'
  'python-jinja: for default starlette template configuration'
  'python-orjson: for ORJSONResponse'
  'python-python-multipart: for form parsing support'
  'python-pyyaml: for starlette SchemaGenerator support'
  'python-httpx: for TestClient support'
  'python-ujson: for faster JSON parsing and UJSONResponse'
  'uvicorn: for Uvicorn as ASGI server'
)
source=($_name-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha512sums=('bed93b84709c64e4f6d170faeade91643a9186962ff5d34bb659fb303ea439c4f52f5e9f1e15f4ca0dd56a5e753ccdaa9bf5372deeb7dbd26ae84f59c393e58a')
b2sums=('c335fbeba34de125d00abec68490f23eefca3b6d313c4a116f887cd66bcebeadf1f8cf78277a42aa81417c4edfb22dad1caf63a9634c20f94c72fddafd00f60b')

prepare() {
  cd $_name-$pkgver
  # do not pin starlette dependency
  sed -i 's|starlette.*"|starlette"|' pyproject.toml
}

build() {
  cd $_name-$pkgver
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  local pytest_options=(
    -vv
    --deselect tests/test_dependency_normal_exceptions.py::test_dependency_gets_exception
    --deselect tests/test_tutorial/test_body_updates/test_tutorial001.py::test_openapi_schema
    --deselect tests/test_tutorial/test_body_updates/test_tutorial001_py310.py::test_openapi_schema
    --deselect tests/test_tutorial/test_body_updates/test_tutorial001_py39.py::test_openapi_schema
    --deselect tests/test_tutorial/test_dataclasses/test_tutorial003.py::test_openapi_schema
    --deselect tests/test_tutorial/test_path_operation_advanced_configurations/test_tutorial004.py::test_openapi_schema
    --deselect tests/test_tutorial/test_path_operation_configurations/test_tutorial005.py::test_openapi_schema
    --deselect tests/test_tutorial/test_path_operation_configurations/test_tutorial005_py310.py::test_openapi_schema
    --deselect tests/test_tutorial/test_path_operation_configurations/test_tutorial005_py39.py::test_openapi_schema
    --deselect tests/test_tutorial/test_path_params/test_tutorial005.py::test_get_enums_invalid
    --deselect tests/test_tutorial/test_separate_openapi_schemas/test_tutorial001.py::test_openapi_schema
    --deselect tests/test_tutorial/test_separate_openapi_schemas/test_tutorial001_py310.py::test_openapi_schema
    --deselect tests/test_tutorial/test_separate_openapi_schemas/test_tutorial001_py39.py::test_openapi_schema
    --deselect tests/test_tutorial/test_templates/test_tutorial001.py::test_main
  )

  cd $_name-$pkgver
  # install to temporary location, as importlib is used
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="test_dir/$site_packages:$PYTHONPATH"
  pytest "${pytest_options[@]}"
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

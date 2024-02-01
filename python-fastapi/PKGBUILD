# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_name=fastapi
pkgname=python-$_name
pkgver=0.109.0
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
sha512sums=('678dc090a341dbb6e771100cedecdd7b1d16e259e3990a8f3edb422fcf4c72b643b94699e1f385a71722ccb4d581564f38ef5895bfb283bf49fdecb750c2d896')
b2sums=('de51bd5677bec0fd0c713a1e684c364dcbbe1ede92a0c2855e57d6f738c651388d2a906cef387891e431e30f71679e1064bb63061497d93914c4d7c9632cdbe9')

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

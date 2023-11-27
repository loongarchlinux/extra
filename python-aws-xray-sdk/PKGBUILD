# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-aws-xray-sdk
_pkgname=aws-xray-sdk-python
# https://github.com/aws/aws-xray-sdk-python/blob/master/CHANGELOG.rst
pkgver=2.12.1
# curl https://api.github.com/repos/aws/aws-xray-sdk-python/git/ref/tags/$pkgver | jq -r .object.sha
_commit=c50fe3e144b4e0654d36b2be40c7ae7139a3e825
pkgrel=1
pkgdesc='AWS X-Ray SDK for Python'
arch=(any)
url='https://github.com/aws/aws-xray-sdk-python'
license=(Apache)
depends=(python python-botocore python-wrapt)
# See extensions in https://github.com/aws/aws-xray-sdk-python/tree/master/aws_xray_sdk/ext
optdepends=(python-aiobotocore python-aiohttp python-bottle python-django
            python-flask python-flask-sqlalchemy python-httpx python-mysql-connector
            python-pg8000 python-psycopg2 python-pymongo python-pymysql
            python-pynamodb python-requests python-sqlalchemy)
makedepends=(git python-build python-installer python-setuptools python-wheel ${optdepends[@]})
checkdepends=(python-pytest python-pytest-asyncio python-pytest-aiohttp python-testing.postgresql
              python-webtest python-django-fake-model python-pytest-benchmark)
source=("git+https://github.com/aws/aws-xray-sdk-python.git#commit=$_commit")
sha256sums=('SKIP')

_backports=(
)

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/^v//;s/-/+/g'
}

prepare() {
  cd $_pkgname

  # this loop is stolen from core/systemd :)
  local _c
  for _c in "${_backports[@]}"; do
    git log --oneline -1 "${_c}"
    git cherry-pick -n "${_c}"
  done
}

build() {
  cd $_pkgname
  python -m build --wheel --no-isolation
}

check() {
  cd $_pkgname

  # See setenv= in upstream tox.ini
  export DJANGO_SETTINGS_MODULE=tests.ext.django.app.settings
  export AWS_SECRET_ACCESS_KEY=fake_key
  export AWS_ACCESS_KEY_ID=fake_id

  # * Use --asyncio-mode=auto to work-around skipped async tests
  # * the test suite for pymysql uses testing.mysqld, which is not
  #   compatible with MariaDB [1]
  # * tests fail with pg8000 > 1.20.0 and upstream explicitly
  #   states no support [2]
  # [1] https://github.com/tk0miya/testing.mysqld/issues/3
  # [2] https://github.com/aws/aws-xray-sdk-python/pull/324
  pytest -v tests --asyncio-mode=auto \
                  --ignore tests/ext/pg8000 \
                  --ignore tests/ext/pymysql
}

package() {
  cd $_pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
}

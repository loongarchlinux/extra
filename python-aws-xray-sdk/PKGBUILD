# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-aws-xray-sdk
_pkgname=aws-xray-sdk-python
# https://github.com/aws/aws-xray-sdk-python/blob/master/CHANGELOG.rst
pkgver=2.14.0
pkgrel=2
pkgdesc='AWS X-Ray SDK for Python'
arch=(any)
url='https://github.com/aws/aws-xray-sdk-python'
# https://github.com/aws/aws-xray-sdk-python/blob/2.13.0/setup.py#L23
license=('Apache-2.0')
depends=(python python-botocore python-wrapt)
# See extensions in https://github.com/aws/aws-xray-sdk-python/tree/master/aws_xray_sdk/ext
_optdepends_tested=(python-aiobotocore python-bottle
                    python-flask python-mysql-connector
                    python-psycopg2 python-pymongo
                    python-sqlalchemy)
_optdepends_untested=(python-aiohttp python-django python-httpx python-pymysql python-pynamodb python-requests)
optdepends=(${_optdepends_tested[@]} ${_optdepends_untested[@]})
makedepends=(git python-build python-installer python-setuptools python-wheel)
checkdepends=(
  python-pytest
  python-pytest-asyncio
  # Needed by tests/ext/bottle
  python-webtest
  # Needed by tests/test_local_sampling_benchmark.py
  python-pytest-benchmark
  ${_optdepends_tested[@]}
)
source=("git+https://github.com/aws/aws-xray-sdk-python.git#tag=$pkgver")
sha256sums=('c9f6b2d52e7a1b4b9cb8471b2dd3719debd9e53d1d390990e33ea42f3287a025')

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

  local _pytest_common_flags=(
    # Use --asyncio-mode=auto to work-around skipped async tests
    --asyncio-mode=auto
  )
  local _pytest_core_flags=(
    --ignore tests/ext
  )
  local _pytest_ext_flags=(
    # The test suite for pymysql uses testing.mysqld, which is not
    # compatible with MariaDB
    # https://github.com/tk0miya/testing.mysqld/issues/3
    --ignore tests/ext/pymysql
    # tests fail with flask_sqlalchemy > 2.5.1 and upstream explicitly
    # states no support
    # https://github.com/aws/aws-xray-sdk-python/pull/360
    --ignore tests/ext/flask_sqlalchemy
    # tests fail with pg8000 > 1.20.0 and upstream explicitly
    # states no support
    # https://github.com/aws/aws-xray-sdk-python/pull/324
    --ignore tests/ext/pg8000
    # HTTP-related tests use httpbin.org, which is an unstable server
    # and fails from time to time
    --ignore tests/ext/aiohttp
    --ignore tests/ext/httplib
    --ignore tests/ext/httpx
    --ignore tests/ext/requests
    # Needs python-testing.postgresql, which uses nose for its test suite and gets no commits since 2017
    --ignore tests/ext/psycopg2
    --ignore tests/ext/sqlalchemy_core
    # Needs python-django-fake-model, which gets no new commits since 2017, and no upstream support for Django >= 2
    --ignore tests/ext/django
    # tests fail with Pynamodb 6.x https://github.com/aws/aws-xray-sdk-python/issues/436
    --ignore tests/ext/pynamodb
  )

  # Split core and ext tests following upstream due to some conflicts
  # https://github.com/aws/aws-xray-sdk-python/blob/2.12.1/.github/workflows/UnitTesting.yaml#L26
  pytest -v tests ${_pytest_common_flags[@]} ${_pytest_core_flags[@]}
  pytest -v tests/ext ${_pytest_common_flags[@]} ${_pytest_ext_flags[@]}
}

package() {
  cd $_pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
}

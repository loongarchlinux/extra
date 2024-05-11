# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-geoip2
pkgver=4.8.0
_testdatacommit=1271107ccad72c320bc7dc8aefd767cba550101a
pkgrel=2
pkgdesc="MaxMind GeoIP2 API"
url="https://github.com/maxmind/GeoIP2-python"
license=('Apache')
arch=('any')
depends=(
  'python'
  'python-aiohttp'
  'python-maxminddb'
  'python-requests'
  'python-setuptools'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools-scm'
  'python-wheel'
)
checkdepends=(
  'python-mocket'
  'python-pytest'
)
source=(
  "https://github.com/maxmind/GeoIP2-python/archive/v$pkgver/$pkgname-$pkgver.tar.gz"
  MaxMind-DB-$_testdatacommit.tar.gz::https://github.com/maxmind/MaxMind-DB/archive/$_testdatacommit.tar.gz
)
sha512sums=('e22fac4c5016d6bc17a2e7902ea61f5ac43526a3d86c21a3199a409d084fd7a60001ed553a2c3d355636a06a73baad15014dc0ed41e5bb0eb93cefde5a14509e'
            'a028b07cfdb84b98629e66937472feb291e0c022cf226513d765b21c420672620ff00b9004aa4cf1519d76a428a33600c453335e2fa9832e78e4621307b5723b')

prepare() {
  cd GeoIP2-python-$pkgver
  rmdir tests/data
  ln -s "$srcdir"/MaxMind-DB-$_testdatacommit tests/data
}

build() {
  cd GeoIP2-python-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    # upstream mocket disabled tests for async on py311 as it suspects a client bug:
    # https://github.com/mindflayer/python-mocket/releases/tag/3.11.0
    --deselect tests/webservice_test.py::TestAsyncClient::test_200_error
    --deselect tests/webservice_test.py::TestAsyncClient::test_300_error
    --deselect tests/webservice_test.py::TestAsyncClient::test_500_error
    --deselect tests/webservice_test.py::TestAsyncClient::test_account_id_required
    --deselect tests/webservice_test.py::TestAsyncClient::test_account_id_unkown
    --deselect tests/webservice_test.py::TestAsyncClient::test_auth_invalid
    --deselect tests/webservice_test.py::TestAsyncClient::test_bad_body_error
    --deselect tests/webservice_test.py::TestAsyncClient::test_city_ok
    --deselect tests/webservice_test.py::TestAsyncClient::test_country_ok
    --deselect tests/webservice_test.py::TestAsyncClient::test_insights_ok
    --deselect tests/webservice_test.py::TestAsyncClient::test_ip_address_not_found
    --deselect tests/webservice_test.py::TestAsyncClient::test_ip_address_required
    --deselect tests/webservice_test.py::TestAsyncClient::test_ip_address_reserved
    --deselect tests/webservice_test.py::TestAsyncClient::test_license_key_required
    --deselect tests/webservice_test.py::TestAsyncClient::test_me
    --deselect tests/webservice_test.py::TestAsyncClient::test_no_body_error
    --deselect tests/webservice_test.py::TestAsyncClient::test_out_of_queries_error
    --deselect tests/webservice_test.py::TestAsyncClient::test_permission_required
    --deselect tests/webservice_test.py::TestAsyncClient::test_request
    --deselect tests/webservice_test.py::TestAsyncClient::test_unknown_error
    --deselect tests/webservice_test.py::TestAsyncClient::test_user_id_required
    --deselect tests/webservice_test.py::TestAsyncClient::test_user_id_unkown
    --deselect tests/webservice_test.py::TestAsyncClient::test_weird_body_error
  )

  cd GeoIP2-python-$pkgver
  pytest "${pytest_options[@]}"
}

package() {
  cd GeoIP2-python-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}

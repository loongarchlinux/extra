# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-geoip2
pkgver=4.7.0
_testdatacommit=2b37923df61aa3b5fb6c7edfbf4dc5fafa10258a
pkgrel=1
pkgdesc="MaxMind GeoIP2 API"
url="https://github.com/maxmind/GeoIP2-python"
license=('Apache')
arch=('any')
depends=(
  'python'
  'python-aiohttp'
  'python-maxminddb'
  'python-requests'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
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
sha512sums=('eebcf56dca3cd245379948a5e53d9518761c08ae5c88ab090f118fbf72161111c78172842f9fcbb56f1411e57977b14d13b84c3a35cc339d2d261a578eb24617'
            'a192a9fec623ffb84e369289292bf4a87d91e9a604494583f3bff293eeed56ca1bc1e8db3f89dbccddafe8b35a1d0340ac754998a2c84f6e4d70dfc4d4c7aa1d')

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

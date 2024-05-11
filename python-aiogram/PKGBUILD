# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Evgeniy Filimonov <evgfilim1@gmail.com>

pkgname=python-aiogram
pkgver=2.22.2
pkgrel=4
pkgdesc="A pretty simple and fully asynchronous library for Telegram Bot API written with asyncio and aiohttp"
arch=('any')
url="https://github.com/aiogram/aiogram"
license=('MIT')
depends=('python-aiohttp' 'python-babel' 'python-certifi')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-aiohttp-socks' 'python-redis' 'python-aresponses' 'python-pytest'
              'pifpaf' 'redis')
optdepends=('python-uvloop: fast, drop-in replacement of the built-in asyncio event loop'
            'python-ujson: ultra fast JSON encoder and decoder written in pure C'
            'python-rapidjson: extremely fast C++ JSON parser and serialization library'
            'python-emoji: emojize and demojize support'
            'python-redis: Redis storage support'
            'python-aiohttp-socks: SOCKS4(a) and SOCKS5 proxy support'
#            'python-rethinkdb: RethinkDB storage support'  # No such package yet
)
source=("https://github.com/aiogram/aiogram/archive/v$pkgver/$pkgname-$pkgver.tar.gz"
        $pkgname-replace-aioredis.patch::https://github.com/aiogram/aiogram/pull/1074.patch)
sha512sums=('7cbc979acba4904e503c801c4a823f802a3daf048bc5433e7cf9cb101e6a77f69955f363a73c5559901fa2b674f5092ec8c6336977807feac087581ef35fe5e0'
            '3678f55b8d14cabcaebc8375168992fa55f0f6433c73d9bf98b0fd696120853a4df74cd3867bd866aff5bf0cdf088588aac24d37c90b2d70ce1b39b76c846b4d')

prepare() {
  cd aiogram-$pkgver
  patch -p1 -i ../$pkgname-replace-aioredis.patch
  sed -i -e 's/import aioredis$/import redis.asyncio/' \
         -e 's/aioredis.__version__/"2"/' \
         -e 's/aioredis.connection.parse_url/redis.asyncio.connection.parse_url/' \
         tests/conftest.py
  # only for aioredis <2
  rm tests/test_contrib/test_fsm_storage/test_storage.py
}

build() {
  cd aiogram-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd aiogram-$pkgver
  pifpaf run redis -- bash -c 'python -m pytest --redis $PIFPAF_REDIS_URL'
}

package() {
  cd aiogram-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
  install -Dm644 README.md -t "$pkgdir"/usr/share/doc/$pkgname/
}

# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>

pkgname=python-aws-sam-translator
# https://github.com/aws/serverless-application-model/releases
pkgver=1.73.0
pkgrel=1
pkgdesc='AWS Serverless Application Model (AWS SAM) prescribes rules for expressing Serverless applications on AWS'
arch=(any)
url='https://github.com/aws/serverless-application-model'
license=(Apache)
depends=(python python-botocore python-boto3 python-jsonschema python-pydantic python-typing_extensions)
makedepends=(python-build python-installer python-setuptools python-wheel)
# python-yaml is needed by samtranslator.yaml_helper, while the latter is used in tests only
checkdepends=(python-pytest python-pytest-rerunfailures python-yaml python-parameterized)
# Upstream intentionally exclude tests from sdist
# https://github.com/aws/serverless-application-model/pull/381#issuecomment-382143094
source=("https://github.com/aws/serverless-application-model/archive/v$pkgver/$pkgname-$pkgver.tar.gz"
        "pydantic2.diff")
sha256sums=('b748de069f2a8a9266be28dd0e239b71b70ce4c2d3f71508e2eae8e819c60295'
            '42072cdbba7ff000f78effd55f97cf2768cfdd2c9bce46d0c2114cdfa222f3bb')

prepare() {
  cd serverless-application-model-$pkgver
  # skip pytest-coverage
  sed -i -r 's#--cov\S*\s+\S+##g' pytest.ini

  # Proposed at https://github.com/aws/serverless-application-model/pull/3249#issuecomment-1634980000
  patch -Np0 -i ../pydantic2.diff
}

build() {
  cd serverless-application-model-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd serverless-application-model-$pkgver
  # See https://github.com/aws/serverless-application-model/blob/v1.52.0/Makefile#L9
  AWS_DEFAULT_REGION=us-east-1 pytest tests
}

package() {
  cd serverless-application-model-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}

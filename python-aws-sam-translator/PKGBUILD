# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>

pkgname=python-aws-sam-translator
# https://github.com/aws/serverless-application-model/releases
pkgver=1.83.0
pkgrel=1
pkgdesc='AWS Serverless Application Model (AWS SAM) prescribes rules for expressing Serverless applications on AWS'
arch=(any)
url='https://github.com/aws/serverless-application-model'
license=(Apache)
depends=(python python-botocore python-boto3 python-jsonschema python-pydantic python-typing_extensions)
makedepends=(python-build python-installer python-setuptools python-wheel)
# python-yaml is needed by samtranslator.yaml_helper, while the latter is used in tests only
checkdepends=(python-pytest python-pytest-rerunfailures python-yaml python-parameterized)
source=("https://github.com/aws/serverless-application-model/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('c2b62e20ce0ce9a12e5589b5dd6dad466253860cf95fe42b578e732d3cef53d4')

prepare() {
  cd serverless-application-model-$pkgver
  # skip pytest-coverage
  sed -i -r 's#--cov\S*\s+\S+##g' pytest.ini
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

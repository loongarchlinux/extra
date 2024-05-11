# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>

pkgname=python-aws-sam-translator
# https://github.com/aws/serverless-application-model/releases
pkgver=1.88.0
pkgrel=1
pkgdesc='AWS Serverless Application Model (AWS SAM) prescribes rules for expressing Serverless applications on AWS'
arch=(any)
url='https://github.com/aws/serverless-application-model'
# https://github.com/aws/serverless-application-model/blob/v1.84.0/setup.py#L59
license=('Apache-2.0')
depends=(python python-botocore python-boto3 python-jsonschema python-pydantic python-typing_extensions)
makedepends=(python-build python-installer python-setuptools python-wheel)
# python-yaml is needed by samtranslator.yaml_helper, while the latter is used in tests only
checkdepends=(python-pytest python-pytest-rerunfailures python-yaml python-parameterized)
source=("https://github.com/aws/serverless-application-model/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('12fb05e963e904e72b4b304e0c728cd331e88e41cb87166c53e970674b5b5b66')

prepare() {
  cd serverless-application-model-$pkgver
  # skip pytest-coverage
  sed -i -r 's#--cov\S*\s+\S+##g' pytest.ini
  # Avoid very verbose testing logs
  sed -i -r 's#log_cli\s*=\s*1#log_cli = 0#' pytest.ini
}

build() {
  cd serverless-application-model-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd serverless-application-model-$pkgver
  # See https://github.com/aws/serverless-application-model/blob/v1.52.0/Makefile#L9
  AWS_DEFAULT_REGION=us-east-1 PYTHONPATH="$PWD" pytest tests
}

package() {
  cd serverless-application-model-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-moto
_pkgname=moto
# https://github.com/spulec/moto/blob/master/CHANGELOG.md
pkgver=4.2.12
pkgrel=1
pkgdesc='Moto is a library to mock out the boto library.'
arch=(any)
url='https://github.com/spulec/moto'
license=(Apache)
# NOTE: Keep the order of dependencies matching setup.cfg
# setup.cfg includes setuptools, which is a work around for missing dependencies in aws-xray-sdk [1].
# I use the correct dependency in python-aws-xray-sdk, so python-setuptools is not needed here.
# [1] https://github.com/spulec/moto/pull/4142
depends=(python python-boto3 python-botocore python-cryptography python-requests python-xmltodict
         python-werkzeug python-dateutil python-responses
         python-jinja
         # urllib3 is used by cfnresponse.py, not directly by moto - just to make namcap happy
         python-urllib3)
makedepends=(python-build python-installer python-setuptools python-wheel)
# See requirements-tests.txt, excluding pytest-cov
checkdepends=(python-pytest python-pytest-order python-freezegun)
# Check extras_require in upstream `setup.cfg` for optional dependencies.
# Note that ecdsa is excluded as it is pinned for jose and not used by moto.
optdepends=(
  'python-yaml: for apigatewayv2, cloudformation, s3 and ssm'
  'python-jose: for apigateway, cloudformation and cognitoidp'
  'python-openapi-spec-validator: for apigateway and cloudformation'
  # SNS and SQS still uses docker indirectly, while upstream explicitly removes them
  # https://github.com/spulec/moto/pull/4094
  'python-docker: for awslambda, batch, cloudformation, dynamodb and dynamodbstreams'
  'python-graphql-core: For appsync and cloudformation'
  'python-jsondiff: for iotdata and cloudformation'
  'python-aws-xray-sdk: for xray and cloudformation'
  'python-cfn-lint: for cloudformation'
  'python-sshpubkeys: for cloudformation, directoryservice, ebs, ec2, efs, eks and route53resolver'
  'python-pyparsing: for glue and cloudformation'
  'python-py-partiql-parser: for cloudformation and s3'
  'python-crc32c: for s3'
  'python-flask: for moto_server'
  'python-flask-cors: for moto_server'
  'python-multipart: for moto_proxy'
)
checkdepends+=(python-yaml python-jose python-openapi-spec-validator python-docker
               python-graphql-core python-jsondiff python-aws-xray-sdk
               python-cfn-lint python-sshpubkeys python-pyparsing python-py-partiql-parser
               python-crc32c
               python-flask python-flask-cors python-multipart)
source=("https://github.com/getmoto/moto/archive/refs/tags/$pkgver/$pkgname-$pkgver.tar.gz"
        "fix-tests.diff")
sha256sums=('55e3bba30011512327389a86feeda7d820270849454be09e46c28f1239019451'
            '21305cdf3d650ced1acb1d0f7dde8760b26e32a94c56a5571e798d6b6976cf5a')

prepare() {
  cd $_pkgname-$pkgver

  patch -Np1 -i ../fix-tests.diff
}

build() {
  cd $_pkgname-$pkgver

  # Update versions in setup.cfg and moto/__init__.py, following upstream release pipeline
  # https://github.com/getmoto/moto/blob/master/.github/workflows/release.yml
  python update_version_from_git.py $pkgver

  python -m build --wheel --no-isolation
}

check() {
  cd $_pkgname-$pkgver

  TZ=UTC pytest tests -m 'not requires_docker'
}

package() {
  cd $_pkgname-$pkgver

  python -m installer --destdir="$pkgdir" dist/*.whl
}

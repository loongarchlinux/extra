# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>

pkgname=python-cfn-lint
# https://github.com/aws-cloudformation/cfn-lint/blob/v0/CHANGELOG.md
pkgver=0.87.9
pkgrel=1
pkgdesc='CloudFormation Linter'
arch=(any)
url='https://github.com/aws-cloudformation/cfn-lint'
# https://github.com/aws-cloudformation/cfn-lint/blob/v0.84.0/setup.py#L63 uses "MIT no attribution",
# which corresponds to https://spdx.org/licenses/MIT-0.html
license=('MIT-0')
depends=(python python-yaml python-aws-sam-translator
         python-jsonpatch python-jsonschema python-networkx
         python-junit-xml python-jschema-to-python python-sarif-om
         python-sympy python-regex
         # Unconditionally imported since long time ago, while not listed in setup.py
         # https://github.com/aws-cloudformation/cfn-lint/blob/v0.87.2/src/cfnlint/template/transforms/_protocols.py#L10
         python-typing_extensions)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pydot)
optdepends=(
  'python-pydot: for building graphs from templates'
)
source=("https://github.com/aws-cloudformation/cfn-lint/archive/v$pkgver/cfn-lint-$pkgver.tar.gz"
        'skip-tests-that-require-git.diff')
sha256sums=('9ec412debea53bda9c05662d204f29efae21371997ef0bd298ff79aa88ab92bc'
            '2c00f29edd290e5c0de741ebce53d7a4caa7509a91befc806296c897b0f0e879')

prepare() {
  cd cfn-lint-$pkgver
  patch -Np1 -i ../skip-tests-that-require-git.diff
}

build() {
  cd cfn-lint-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd cfn-lint-$pkgver

  # Tests in test/integration need the cfn-lint binary
  python -m installer --destdir="$PWD/tmp_install" dist/*.whl

  export PYTHONPATH="$PWD/src"
  export PATH="$PATH:$PWD/tmp_install/usr/bin"
  # Using unittest following upstream. `test/unit/module/core/test_run_cli.py`
  # fails if run after `test/unit/module/test_api.py`, which is the case for pytest.
  # The conflict among tests exist after https://github.com/aws-cloudformation/cfn-lint/pull/2646,
  # where the new runner.transform() pollutes environment variables via transform.transform_template()
  python -m unittest discover test
}

package() {
  cd cfn-lint-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}

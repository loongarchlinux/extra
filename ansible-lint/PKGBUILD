# Maintainer: Jelle van der Waa <jelle@archlinux.org>
# Maintainer: Frederik Schwan <freswa at archlinux dot org>
# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Sander Boom <sanderboom@gmail.com>

pkgname=ansible-lint
pkgver=24.2.3
pkgrel=1
pkgdesc="Checks playbooks for practices and behaviour that could potentially be improved."
arch=('any')
url="https://github.com/ansible/ansible-lint"
license=('GPL-3.0-or-later')
depends=(python ansible-core git yamllint
  python-{ansible-compat,black,enrich,filelock,jsonschema,pyaml,packaging,rich,ruamel-yaml,wcmatch})
makedepends=(python-{build,installer,setuptools,setuptools-scm,wheel})
checkdepends=(mypy python-jmespath python-pylint python-pytest python-pytest-mock)
optdepends=('ansible: check official ansible collections')
source=(git+https://github.com/ansible/ansible-lint.git#tag=v$pkgver
        disable_version_check.patch)
b2sums=('76603d5154699a7fc545e455e7f0eb60ccaba8c1686bdfc9b8ed1b36438c6716b98a8154f06abe1183054db9c3b2dd7297acd443ef2e908815474de5d0f0fc60'
        '98294f267ca693c0bc3921f8e076d674a219a891502cd31a0af789bc0b1447b53834b9c85853a134f6bc1ac384f31cb174cba2d55fbcc1636cae9bd3c0bd8f84')

prepare() {
  cd ${pkgname}
  # stop ansible-lint from calling home every 24h to check for a new version
  patch -Np1 < "${srcdir}"/disable_version_check.patch
}

build() {
  cd ${pkgname}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd $pkgname
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  local pytest_options=(
    -vv
    --ignore test/test_schemas.py  # requires deprecated spdx
    # don't run tests against venvs and hardcoded locations
    --deselect 'test/test_eco.py::test_eco[bootstrap]'
    --deselect 'test/test_eco.py::test_eco[cisco.nxos]'
    --deselect 'test/test_eco.py::test_eco[colsystem]'
    --deselect 'test/test_eco.py::test_eco[debops]'
    --deselect 'test/test_eco.py::test_eco[docker-rootless]'
    --deselect 'test/test_eco.py::test_eco[hardening]'
    --deselect 'test/test_eco.py::test_eco[mysql]'
    --deselect 'test/test_main.py::test_call_from_outside_venv[normal]'
    --deselect 'test/test_main.py::test_call_from_outside_venv[isolated]'
    --deselect 'test/test_rules_collection.py::test_rules_id_format'
    --deselect 'test/test_main.py::test_get_version_warning[v1.2.2-True-pre-release-1]'
    --deselect 'test/test_main.py::test_get_version_warning[v1.2.3-False--1]'
    --deselect 'test/test_main.py::test_get_version_warning[v1.2.4-True-new release-2]'
    --deselect 'test/test_main.py::test_nodeps[1]'
    --deselect 'test/test_main.py::test_nodeps[2]'
    --deselect 'test/test_main.py::test_broken_ansible_cfg'
   )

  # install to temporary location, as importlib is used
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="$PWD/test_dir/$site_packages:$PYTHONPATH"
  export PATH="$PWD/test_dir/usr/bin:$PATH"
  pytest "${pytest_options[@]}" test/
}

package() {
  cd ${pkgname}
  python -m installer --destdir="${pkgdir}" dist/*.whl
}

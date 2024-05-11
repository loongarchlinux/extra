# Maintainer: Andreas 'Segaja' Schleifer <segaja at archlinux dot org>

_name='libvcs'
pkgname="python-${_name}"
pkgver=0.29.0
pkgrel=1
pkgdesc='Lite, typed, pythonic utilities for git, svn, mercurial, etc'
arch=('any')
url='https://libvcs.git-pull.com/'
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-poetry-core')
checkdepends=('git' 'mercurial' 'python-pytest' 'python-pytest-mock' 'subversion')
optdepends=(
  'git: for git repository support'
  'mercurial: for mercurial repository support'
  'subversion: for subversion repository support'
  'python-pytest: for pytest plugin'
)
source=("https://github.com/vcs-python/libvcs/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('8b87e690dc5ba2aada007fddd0c7d924a0dc3df390105c8fb84347721ac6a155edc9e029795950083adf3c704c9d68743376b675aa3e0d9aad8fc9808b69a835')
b2sums=('ff3ee890d37bb8f8568a2534d9b3fed76ceb8d5ee7416f118a7b80e6028a0e708850a6125805de8f8968c01f159830a345e850166fc581b1cd7c3ed5544696ce')

build() {
  cd  "${_name}-${pkgver}"

  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd  "${_name}-${pkgver}"

  local _site_packages="$(python -c "import site; print(site.getsitepackages()[0])")"

  python -m installer --destdir=test_dir dist/*.whl

  export PYTHONPATH="test_dir${_site_packages}:${PYTHONPATH}"

  pytest -vv tests
}

package() {
  cd  "${_name}-${pkgver}"

  python -m installer --destdir="${pkgdir}" dist/*.whl

  install --verbose -D --mode=0644 LICENSE --target-directory "${pkgdir}/usr/share/licenses/${pkgname}"
  install --verbose -D --mode=0644 *.md CHANGES MIGRATION --target-directory "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: tabstop=2 shiftwidth=2 expandtab:

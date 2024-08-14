# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

_name=pynitrokey
pkgname=python-pynitrokey
pkgver=0.4.49
pkgrel=1
pkgdesc="A command line interface for the Nitrokey FIDO2 and Nitrokey Start"
arch=(any)
url="https://github.com/Nitrokey/pynitrokey"
license=('Apache-2.0 OR MIT')
depends=(
  libnitrokey  # NOTE: libnitrokey is required for udev rules
  python
  python-certifi
  python-cffi
  python-click
  python-click-aliases
  python-cryptography
  python-dateutil
  python-ecdsa
  python-fido2
  python-frozendict
  python-intelhex
  python-nethsm
  python-nkdfu
  python-protobuf
  python-pyserial
  python-pyusb
  python-requests
  python-semver
  python-spsdk
  python-tlv8
  python-tqdm
  python-typing_extensions
)
makedepends=(
  git
  python-build
  python-flit-core
  python-installer
  python-wheel
)
checkdepends=(python-pytest)
optdepends=(
  'python-libusb1: for pro and storage subcommands'
  'python-pyscard: for pcsclite integration'
)
source=(
  "$_name::git+$url.git?signed#tag=v$pkgver"
  https://raw.githubusercontent.com/NordicSemiconductor/pc-nrfutil/16cb5a3d352bcc7a3ddbbf541426e3cca0f34671/nordicsemi/dfu/dfu-cc.proto
)
sha512sums=('63eac3a2f484c2cf21c524817448452dc9990e79155067bd2b0691da61c1723b7e4d5919cdd3af6841af13e143f214762feb0c5f8e0d49175e2d6797c8a26a8e'
            '5da1202115f2fb76f8f2d592a2a510d9815e52dcb529e245afb5bbed22571e11b3a8c6743fc3e3824fcfea5bb408373e2ed4e65e4ca43f8159c0e01e05080193')
b2sums=('251efabc3c8ba005b91fe28c2a0e117885b3dec9fab6c56296c77b2813dc6905f5c1c52525bc5e769ecb055fe2358c7f81f974797668a645107006afca29066f'
        'a999aeee79d06fe9201fdb115cbd03cb59ac84724893bc334bff8a071cd9ae13990793b889b6281df0d6e4dd229e77e5f24b73d51a69363f30d6bedf8d3cfd59')
validpgpkeys=(
  868184069239FF65DE0BCD7DD9BAE35991DE5B22  # Szczepan Zalega <szczepan@nitrokey.com> (@szszszsz)
  CC74B7120BFAA36FF42868724C1449F1C9804176  # Markus Meissner <meissner@nitrokey.com> (@daringer)
  719EA31C3F1814DA787C8FD434F47D2F044B8F17  # Robin Krahl <robin@nitrokey.com> (@robin-nitrokey)
  93CCB0DB717DAE30622F671436DA48A4C827B354  # Sosthène Guédon <sosthene@nitrokey.com> (@sosthene-nitrokey)
)

prepare() {
  # Regenerate protobuf code for protobuf 27+
  protoc dfu-cc.proto --python_out $_name/pynitrokey/trussed/bootloader/nrf52_upload/dfu/
}

build() {
  cd $_name
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd $_name
  pytest -vv
}

package() {
  cd $_name
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -vDm 644 LICENSE-MIT -t "$pkgdir/usr/share/licenses/$pkgname/"
}

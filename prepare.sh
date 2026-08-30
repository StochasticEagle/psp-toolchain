#!/bin/bash
set -e

echo "Detecting OS and installing packages required for PSP Toolchain"

UNAME_S="$(uname -s)"

#Handle macOS first
if [ "$UNAME_S" = "Darwin" ]; then
  ## Check if using brew
  if command -v brew &> /dev/null; then
    brew update
    brew install gettext texinfo bison flex gnu-sed ncurses gsl gmp mpfr autoconf automake cmake libusb-compat libarchive gpgme bash openssl libtool zlib makepkg meson ninja
    brew reinstall openssl # https://github.com/Homebrew/homebrew-core/issues/169728#issuecomment-2074958306
  fi
  ## Check if using MacPorts
  if command -v port &> /dev/null; then
    sudo port install autoconf automake cmake doxygen gsed libelf libtool pkgconfig
  fi
elif [[ "$UNAME_S" == MINGW* ||
      "$UNAME_S" == MSYS_* ||
      "$UNAME_S" == UCRT64* ]]; then

    command -v pacman >/dev/null 2>&1 || {
        echo "ERROR: MSYS2 pacman not found."
        exit 1
    }

    pacman -S --needed --noconfirm \
        base-devel \
        git \
        patch \
        wget \
        tar \
        pkgconf \
        meson \
        ninja \
        libarchive-devel \
        openssl-devel \
        libgpg-error-devel \
        libgpgme-devel \
        libcurl-devel

    exit 0
else

    TESTOS=$(cat /etc/os-release | grep -w "ID" | cut -d '=' -f2)

    case $TESTOS in

    ubuntu | debian)
        sudo apt-get update
        sudo apt-get -y install build-essential cmake git wget texinfo bison flex gettext libtool libgsl-dev libgmp3-dev libmpfr-dev libmpc-dev libusb-dev libreadline-dev libcurl4 \
        libcurl4-openssl-dev libssl-dev libarchive-dev libgpgme-dev libz-dev meson ninja-build makepkg
    ;;
    rhel | fedora)
         dnf -y install @development-tools gcc gcc-c++ g++ wget git autoconf automake meson ninja-build makepkg make cmake pkgconf \
          libarchive-devel openssl-devel gpgme-devel libtool gettext texinfo bison flex gmp-devel mpfr-devel libmpc-devel ncurses-devel diffutils \
          libusb-compat-0.1-devel readline-devel libcurl-devel which glibc-gconv-extra xz gawk file
    ;;
    gentoo)
        sudo emerge --noreplace net-misc/wget dev-vcs/git dev-python/pip sys-apps/fakeroot \
                                        app-arch/libarchive app-crypt/gpgme sys-devel/bison sys-devel/flex\
                                        dev-libs/mpc dev-libs/libusb-compat dev-build/meson dev-build/ninja
    ;;
    arch)
        sudo pacman -S --needed gcc clang make cmake patch git texinfo flex bison gettext wget gsl gmp mpfr libmpc libusb readline libarchive gpgme bash openssl libtool libusb-compat boost meson ninja
    ;;
    *)
        echo "$TESTOS not supported here"
    ;;
    esac

fi

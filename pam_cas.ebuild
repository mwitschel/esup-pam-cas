EAPI=7

inherit pam

DESCRIPTION="PAM CAS Module"
HOMEPAGE="https://github.com/EsupPortail/esup-pam-cas"
SRC_URI="https://github.com/mwitschel/esup-pam-cas/archive/refs/tags/${PV}.tar.gz"

LICENSE="|| ( GPL-2 LGPL-2 )"
SLOT="0"
KEYWORDS="~alpha ~amd64 arm arm64 ~hppa ~ia64 ~mips ppc ppc64 sparc x86"
IUSE="ssl"

DEPEND="sys-libs/pam
    dev-libs/openssl
    virtual/libcrypt"

RDEPEND="${DEPEND}"

src_prepare() {
    default
    cp sources/Makefile.redhat sources/Makefile
}

src_compile()
{
    cd sources
    make
}


src_install() {
    default
    dopammod sources/pam_cas.so
    dopamsecurity . pam_cas.conf
}

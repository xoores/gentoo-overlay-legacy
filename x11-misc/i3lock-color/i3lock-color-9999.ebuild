# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit eutils toolchain-funcs git-2

DESCRIPTION="Simple screen locker"
HOMEPAGE="https://github.com/Arcaena/i3lock-color"
EGIT_REPO_URI="https://github.com/Arcaena/i3lock-color.git"
EGIT_BRANCH=master

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

MY_PN=i3lock

RDEPEND="!x11-misc/i3lock
	virtual/pam
	dev-libs/libev
	>=x11-libs/libxkbcommon-0.5.0[X]
	x11-libs/libxcb[xkb]
	x11-libs/xcb-util
	x11-libs/cairo[xcb]"
DEPEND="${RDEPEND}
	virtual/pkgconfig"
DOCS=( CHANGELOG README.md )

pkg_setup() {
	tc-export CC
}

src_prepare() {
	sed -i -e 's:login:system-auth:' ${MY_PN}.pam || die
	sed -i -e '/MANDIR/d' Makefile || die
	epatch_user
}

src_install() {
	default
	doman ${MY_PN}.1
	# mv -v "${D}"/etc/pam.d/${MY_PN} "${D}"/etc/pam.d/${PN} || die
}

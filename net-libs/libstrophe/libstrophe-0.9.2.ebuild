# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit eutils git-r3 libtool autotools


DESCRIPTION="Lightweight XMPP client library written in C"
HOMEPAGE="http://strophe.im/libstrophe/"
#SRC_URI="https://github.com/jaagr/polybar/archive/${PV}.tar.gz -> ${PF}.tar.gz"

EGIT_REPO_URI="https://github.com/strophe/libstrophe"
EGIT_COMMIT="${PV}"


LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm x86"
IUSE=""


RDEPEND="dev-libs/libxml2"
DEPEND="dev-libs/libxml2
		dev-util/cmake
		>=sys-devel/gcc-5.1
"

DOCS=()

src_prepare()
{
	eautoreconf
	default
}

src_configure()
{
	einfo "Running configure"
	econf || die "configure failed"
}

src_compile()
{
	emake || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" install
}

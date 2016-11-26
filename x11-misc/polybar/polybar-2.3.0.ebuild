# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit eutils git-r3


DESCRIPTION="A fast and easy-to-use tool for creating status bars."
HOMEPAGE="https://github.com/jaagr/polybar"
#SRC_URI="https://github.com/jaagr/polybar/archive/${PV}.tar.gz -> ${PF}.tar.gz"

EGIT_REPO_URI="https://github.com/jaagr/polybar.git"
EGIT_COMMIT="${PV}"


LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm x86"
IUSE=""

#S="${WORKDIR}/bar-${PV}"

RDEPEND="x11-libs/libxcb"
DEPEND="dev-lang/perl
		dev-util/cmake
		dev-libs/boost
		x11-libs/xcb-util-image
		x11-libs/xcb-util-wm
		x11-libs/libXft
		>=sys-devel/clang-3.5
		>=sys-devel/gcc-5.1
"

DOCS=()

src_prepare()
{
	sed -i -e '/Werror/d' cmake/build/core.cmake || die "Sed failed!"
	#sed -i -e 's/-Os//' Makefile || die "Sed failed"
	mkdir build
	default
}

src_compile()
{
	#cd build
	cmake -DCMAKE_BUILD_TYPE=Release || die "cmake failed"
}

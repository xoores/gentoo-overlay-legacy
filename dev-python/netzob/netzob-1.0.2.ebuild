# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python3_4 )

inherit eutils distutils-r1 python-r1

MY_PN="Netzob"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Network protocol modelization by reverse engineering"
HOMEPAGE="http://www.netzob.org/"

SRC_URI="https://github.com/netzob/${PN}/archive/Release/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
#IUSE="doc debug"
IUSE="debug"

RDEPEND="
	x11-libs/gtk+:3
	dev-python/impacket
	dev-util/strace
	sys-process/lsof
	>=dev-python/lxml-2.3
	dev-python/bitarray
	dev-python/Babel
	dev-python/pygobject:3
	dev-python/pcapy
	dev-python/python-ptrace
	>=dev-python/httplib2-0.7.0
	dev-python/ipython
	dev-python/bintrees
	dev-python/netaddr
	dev-python/arpreq
	media-gfx/graphviz"
DEPEND="${RDEPEND}
	>=dev-python/setuptools-0.6.30-r1"
#	doc? ( >=dev-python/sphinx-1.1.3 )"

S="${WORKDIR}/${PN}-Release-${PN}-${PV}"/${PN}
DOCS=( README.rst AUTHORS.txt NEWS.rst COPYING.txt )

src_compile() {
	use debug && NETZOB_COMPILE_PROFILE="debug ${NETZOB_COMPILE_PROFILE}"
	export NETZOB_COMPILE_PROFILE


	distutils-r1_src_compile

	#if use doc; then
	#	einfo "Generation of documentation"
	#	pushd doc/documentation >/dev/null
	#	sphinx-build -b html source html || die "Generation of documentation failed"
	#	popd >/dev/null
	#fi
}

src_install() {
	distutils-r1_src_install
	#use doc && HTML_DOCS=( doc/documentation/html/ )
	#doman doc/netzob.1
}

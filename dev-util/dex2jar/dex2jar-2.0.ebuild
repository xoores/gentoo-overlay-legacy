# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

DESCRIPTION="Tools to work with android .dex and java .class files"
HOMEPAGE="https://github.com/pxb1988/dex2jar"
#SRC_URI="http://dex2jar.googlecode.com/files/${P}.zip"
SRC_UTIL="https://github.com/pxb1988/${PN}/${P}.tar.gz -> ${P}.tar.gz"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

RDEPEND="|| ( virtual/jre virtual/jdk )"

src_prepare() {
	default
	#rm *.bat
	#chmod a+x *.sh
	#rm *.txt

	#cd lib
	#mv dx-NOTICE dx-NOTICE.txt
	#rm *.txt
}

src_install() {
	local dir="/usr/share/${P}"

	exeinto "${dir}"
	doexe dex-tools/build/generated-sources/bin/*.sh

	rm */build/libs/*-sources.jar
	insinto "${dir}/lib"
	doins */build/libs/*.jar

	dosym "${dir}/d2j-${PN}.sh" "/usr/bin/${PN}"
}

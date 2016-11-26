# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$


EAPI="6"

inherit linux-info autotools

DESCRIPTION="Console-based Audio Visualizer for ALSA (=CAVA)"
HOMEPAGE="https://github.com/karlstav/cava"
SRC_URI="https://github.com/karlstav/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="debug"

DEPEND="sci-libs/fftw
		"
RDEPEND="${DEPEND}"

pkg_setup() {
	if linux_config_exists ; then
		einfo "Checking kernel configuration at $(linux_config_path)..."
		if ! linux_chkconfig_present SND_ALOOP ; then
			ewarn 'Kernel option CONFIG_SND_ALOOP=[ym] needed but missing'
		fi
	fi
}

src_prepare()
{
	eapply_user

	./autogen.sh

}

src_configure()
{
	local mycnf;
	
	if has_version dev-libs/iniparser:4 ; then
		einfo "You seem to have NEW versino of dev-libs/iniparser installed. Good!"
	else
		einfo "You have OLD version of dev-libs/iniparser installed. Using legacy mode."
		mycnf="${mycnf} --enable-legacy_iniparser"
	fi


	if use debug ; then
		einfo "DEBUG build enabled"
		mycnf="${mycnf} --enable-debug"
	fi

	econf ${mycnf}
}

src_compile() {
	# TODO resolve bundled iniparser
	# https://github.com/karlstav/cava/issues/49
	emake -j1 || die
}

src_install() {
	dodoc README.md
	emake DESTDIR="${D}" PREFIX=/usr install || die
}

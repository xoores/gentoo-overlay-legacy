# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit golang-build golang-vcs user

EGO_PN="github.com/42wim/matterircd"

KEYWORDS=""

DESCRIPTION="Connect to your local/remote mattermost installation or to slack via your IRC-client."
HOMEPAGE="https://github.com/42wim/matterircd"

LICENSE="Apache-2.0"
SLOT="0"
IUSE=""

DEPEND=">=dev-lang/go-1.8"

pkg_setup() {
	enewgroup matterbridge
	enewuser matterbridge -1 -1 -1 matterbridge
}

src_install() {
	default

	newinitd "${FILESDIR}"/initd matterircd
	dobin matterircd
	fowners matterbridge:matterbridge /usr/bin/matterircd || die "fowners failed"
}

pkg_postinst() {
	einfo "Configuration of Mattermost-IRC gateway is in its initscript. You"
	einfo "have to change it accordingly to fit your settings"
}

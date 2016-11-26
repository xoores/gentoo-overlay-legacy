# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit font

DESCRIPTION="Gohufont: a bitmap font for programming and terminal use"
HOMEPAGE="http://font.gohu.eu/"
SRC_URI="http://font.gohu.eu/${P}.tar.gz"

LICENSE="WTFPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

FONT_SUFFIX="pcf.gz"
DOCS="README.md"

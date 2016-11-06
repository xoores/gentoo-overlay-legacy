# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
PYTHON_COMPAT=(python2_7)

inherit distutils-r1

DESCRIPTION="A Python library for automating interaction with websites."
HOMEPAGE="https://github.com/Legrandin/pycryptodome"
SRC_URI="https://pypi.python.org/packages/bf/73/7c7e75e640acce1428d1cd7ce596fb855bd9ab8df9d1be587a9b4172046a/pycryptodomex-3.4.3.tar.gz#md5=5493d3b327504ee4967c756cff3744a8 -> ${P}.tar.gz"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="dev-python/requests[${PYTHON_USEDEP}]
	dev-python/python-dateutil[${PYTHON_USEDEP}]"



src_prepare()
{
	mkdir ${WORKDIR}/${P}/build
}

# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="TilEm is an emulator and debugger for Texas Instruments Z80-based graphing calculators."
HOMEPAGE="http://lpg.ticalc.org/prj_tilem/index.html"
SRC_URI="mirror://sourceforge/${PN}/${PN}/${PV}/${P}.tar.bz2"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="
	sci-libs/libticalcs2
	x11-libs/gtk+:2
"
RDEPEND="${DEPEND}"

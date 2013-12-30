# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-libs/libaacs/libaacs-0.7.0.ebuild,v 1.1 2013/12/22 10:45:59 radhermit Exp $

EAPI=5

inherit autotools-utils

DESCRIPTION="Open implementation of BD+ protocol"
HOMEPAGE="http://www.videolan.org/developers/libbdplus.html"
SRC_URI="ftp://ftp.videolan.org/pub/videolan/libbdplus/${PV}/${P}.tar.bz2"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~ppc64 ~x86 ~amd64-fbsd"
IUSE="static-libs"

RDEPEND="dev-libs/libgcrypt
	dev-libs/libgpg-error
	media-libs/libaacs"
DEPEND="${RDEPEND}"

DOCS=( ChangeLog README.txt )

AUTOTOOLS_IN_SOURCE_BUILD=1

src_configure() {
	local myeconfargs=(
		--disable-optimizations
	)
	autotools-utils_src_configure
}

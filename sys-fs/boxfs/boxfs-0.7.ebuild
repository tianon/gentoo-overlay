# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit eutils

DESCRIPTION="A FUSE filesystem to access files on box.net accounts"
HOMEPAGE="https://code.google.com/p/boxfs/"
SRC_URI="http://${PN}.googlecode.com/files/${P}.tgz"
LICENSE="GPL-2"

SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="sys-fs/fuse
	dev-libs/libxml2
	net-misc/curl
	dev-libs/libzip
	dev-libs/libapp"
DEPEND="${RDEPEND}
	dev-util/pkgconfig"

src_install() {
	dodir /usr/bin
	emake PREFIX="${D}usr" install

	dodoc README
}

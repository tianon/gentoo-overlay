# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="Alpine Package Keeper - package manager for alpine"
HOMEPAGE="http://git.alpinelinux.org/cgit/apk-tools"
SRC_URI="http://git.alpinelinux.org/cgit/${PN}/snapshot/${P}.tar.bz2"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	sed -i -e 's/-Werror //' Make.rules || die
}

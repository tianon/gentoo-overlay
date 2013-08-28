# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

EGIT_REPO_URI="git://github.com/drotiro/${PN}.git
	http://github.com/drotiro/${PN}.git"
inherit git-2

DESCRIPTION="Utilities for repetitive tasks in app development"
HOMEPAGE="https://github.com/drotiro/libapp"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

src_install() {
	dodir /usr/bin
	emake PREFIX="${D}usr" install

	dodoc README.md
	dodoc -r test/
}

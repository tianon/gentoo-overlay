# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="File sync without servers."
HOMEPAGE="https://www.aerofs.com/"
SRC_URI="http://cache.client.aerofs.com/${PN}-installer-${PV}.deb"
RESTRICT="mirror"

inherit unpacker gnome2-utils

LICENSE="" # unknown
SLOT="0"
KEYWORDS="~amd64"
IUSE="gtk"

DEPEND="
	app-arch/sharutils
	sys-process/procps
	virtual/jre
	gtk? ( gnome-base/libgnomeui )
"
RDEPEND="${DEPEND}"

S="${WORKDIR}"

src_install() {
	cp -R * "${D}/"
}

pkg_postinst() {
	gnome2_icon_cache_update
}

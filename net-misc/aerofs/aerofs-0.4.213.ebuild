# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="File sync without servers."
HOMEPAGE="https://www.aerofs.com/"
SRC_URI="http://cache.client.aerofs.com/${PN}-installer.deb -> ${P}.deb"
RESTRICT="mirror"

inherit unpacker gnome2-utils

LICENSE="" # unknown
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="
	app-arch/sharutils
	gnome-base/libgnomeui
	sys-process/procps
	virtual/jre
"
RDEPEND="${DEPEND}"

S="${WORKDIR}"

pkg_nofetch() {
	eerror "AeroFS does not use versioned filenames."
	eerror "An ebuild version bump is probably required."
	eerror ""
	eerror "Please see the following URL for the current version number:"
	eerror "https://support.aerofs.com/entries/23864878-Release-Notes"
}

src_install() {
	cp -R * "${D}/"
}

pkg_postinst() {
	gnome2_icon_cache_update
}

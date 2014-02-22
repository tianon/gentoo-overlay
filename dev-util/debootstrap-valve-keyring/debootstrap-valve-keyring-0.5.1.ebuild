# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit versionator
MY_PN="valve-archive-keyring"
MY_PV="$(replace_version_separator 2 '+bsos')"

DESCRIPTION="GnuPG keys for the SteamOS project repositories and archives"
HOMEPAGE=""
SRC_URI="http://repo.steampowered.com/steamos/pool/main/v/${MY_PN}/${MY_PN}_${MY_PV}_all.deb"

inherit unpacker

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~sh ~sparc ~x86 ~amd64-linux ~x86-linux"
IUSE=""

DEPEND="app-crypt/gnupg"
RDEPEND="${DEPEND}"

S="${WORKDIR}"

src_install() {
	cp -R * "${D}/"
}
